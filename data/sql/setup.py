'''
    This file is part of SWGANH which is released under the MIT license.
    See file LICENSE or go to http://swganh.com/LICENSE
    
    Run example:
        python3 setup.py [input value 1] [input value 2] [input value 3]
    
    Description:
        Before displaying the menu the menu runs all of the given input values.
        If one of the input values is q the program will quit. Otherwise it will prompt.
'''

import os, sys, datetime
from configparser import RawConfigParser

#### CONSTANTS ####

defaults = {'username': 'swganh', 'password': 'swganh', 'host': 'localhost', 'pause': 'on', 'clear': 'on'}

affirmatives = ['yes', 'on', '1', 'true']

#### MAIN FUNCTION ####

def main(args):
    '''
        The main method.
        
        Parameters:
            args - the system arguments (sys.argv)
    '''
    #Load all configuration data
    cfg = getCfg()
    cfg['cwd'] = os.getcwd()
    cfg['databases'] = getImmediateSubdirectories(cfg['cwd'])
    
    #Defer processing to the main menu
    Menu(cfg).run(args[1:])

#### OPERATIONS ####

def installDatabase(cfg, database):
    '''
        Installs the given database.
        
        Parameters:
        cfg - the dictionary of config values
        database - the name of the database to install.
    '''
    for dirpath, _, filenames in os.walk(os.path.join(cfg['cwd'], database)):
        cfg['database'] = database
        for filename in filenames:
            callMysql(cfg, os.path.join(dirpath, filename))

def backupDB(cfg):
    '''
        Backs up the db to a timestampped file.
        
        Parameters:
        cfg - the dictionary of config values
    '''
    print("Backup started. Please be patient...")
    timestamp = str(datetime.datetime.now()).replace(' ', '_').replace(':', '_')
    os.system(("mysqldump --password="+cfg['password']+" --host="+cfg['host']+" --user="+cfg['username']+" "+
        "--databases "+(" ".join(cfg['databases']))+" --create-options --extended-insert --routines "+
        "--dump-date --triggers --comments > swganh_"+timestamp+".sql"))

#### MENU MANAGEMENT ####
class Menu(object):
    '''
        Encapsulates the main menu in a Menu object.
        Slots:
            cfg - the configuration dictionary
            operations - a list of operations. Each operation is a 2-tuple of (operation name, operation functor)
    '''
    __slots__ = ('cfg', 'operations')

    def __init__(self, cfg):
        '''
            Creates a new Menu Object
        '''
        self.cfg = cfg
        self.operations = []

        #Add some operations!
        self.operations.append(('Install All DB', lambda cfg: list(map((lambda db: installDatabase(cfg, db)), cfg['databases']))))
        for i in range(len(cfg['databases'])):
            self.operations.append(('Install '+cfg['databases'][i], lambda cfg: installDatabase(cfg, cfg['databases'][i])))
        self.operations.append(('Backup DB', backupDB)) 
        self.operations.append(('Rebuild Config', rebuildCfg))

    def printMenu(self):
        '''
            Optionally clears the screen based upon config values, and then prints
            the menu.
        '''
        #Clear screen in a cross platform fashion
        if self.cfg['clear'].lower() in affirmatives:
            os.system( [ 'clear', 'cls' ][ os.name == 'nt' ] )

        print('----------------------------------------------------------------------')
        print(' SWGANH Database Install Script                              (v0.5.1) ')
        print('----------------------------------------------------------------------')

        for i in range(len(self.operations)):
            print("\t"+str(i)+". "+self.operations[i][0])

        print('----------------------------------------------------------------------')

    def run(self, buf=[]):
        '''
            Prints the screen and then loops over inputs until a 'q' is found.
            
            Parameters:
                buf - a list of operations to perform
        '''
        if len(buf) == 0:
            self.printMenu()
            buf = input('Make a choice or (q)uit: ').split()
        while(True):
            try:
                #Grab the next step
                step = buf.pop(0)
                
                #Check if the input is our exit condition
                if step == 'q':
                    break
                else:
                    #Check that the buffer is a valid entry.
                    step = int(step)
                    if step < 0 or step >= len(self.operations):
                        raise ValueError()
                    
                    #Attempt to execute the option, catching exceptions in case of problems.
                    try:
                        self.operations[step][1](self.cfg)

                        if self.cfg['pause'].lower() in affirmatives:
                            input("Operation complete. Press to continue...")
                    except e:
                        print(e)
            except:
                print('Invalid choice.')
                
            #Check if we need more input
            if len(buf) == 0:
                self.printMenu()            
                buf = input('Make a choice or (q)uit: ').split()
            
            

#### CONFIGURATION MANAGEMENT ####

def rebuildCfg(oldCfg=None):
    '''
        Rebuilds the configuration file from user inputs.
        
        Optional Parameters:
            oldCfg - if defined values will be inserted into this dict instead of returned.
            
        Return:
            the new configuration dictionary.
    '''
    cfgParse = RawConfigParser()
    cfgParse['DEFAULT'] = defaults

    cfg = {}

    #Get user inputs
    cfg['username'] = input('Mysql Username (default=swganh): ')
    cfg['password'] = input('Mysql Password (default=swganh): ')
    cfg['host'] = input('Mysql Host (default=localhost): ')
    cfg['pause'] = input('Pause after each operation? (default=on): ')
    cfg['clear'] = input('Clear screen before printing menu? (default=on): ')

    #Set the default if the user chose to input nothing
    for k,v in defaults.items():
        if cfg[k] == '':
            cfg[k] = v

    #Write out data
    cfgParse['DEFAULT'] = cfg
    cfgParse.write(open('setup.cfg', 'w'))
    
    #Determine if we need to reset live values, or just return
    if oldCfg != None:
        for k,v in cfg.items():
            oldCfg[k] = v
    else:
        return cfg

def getCfg():
    '''
        Loads the config from disk or rebuilds it from user input.
        
        Return:
            the dictionary of user inputs
    '''
    try:
        #Attempt to load the file from the config
        with open('setup.cfg') as fp:
            cfgParse = RawConfigParser()
            cfgParse['DEFAULT'] = defaults            
            cfgParse.readfp(fp)
            return dict(cfgParse['DEFAULT'])
    except:
        #If we failed we'll rebuild the config.
        print('Config missing or invalid. Is this the first run?')
        return rebuildCfg()

#### MYSQL MANAGEMENT ####

def getImmediateSubdirectories(path):
    '''
        Return:
            a list of immediate subdirectories
    '''
    return [subdir for subdir in os.listdir(path) 
        if os.path.isdir(os.path.join(path, subdir))]

def callMysql(cfg, filename):
    '''
        Installs the given filename into the proper database.
        
        Parameters:
            cfg - the configuration dictionary
            filename - the file to install.
    '''    
    if os.path.splitext(filename)[1] == '.sql':
        cfg['filename'] = filename
        
        #Find the short name
        shortname = os.path.split(filename)[1]
    
        #Add databases unless it's a create.sql script.
        dbs = ''
        if shortname != 'create.sql':
            dbs = '--database=%(database)s ' % cfg
        
        print("Installing {} ".format(shortname), end="")
        os.system("mysql --password=%(password)s --host=%(host)s --user=%(username)s "+dbs+"--default-character-set=utf8 < \"%(filename)s\"" % cfg)
        print("[DONE]")

main(sys.argv)
