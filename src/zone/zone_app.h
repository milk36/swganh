/*
---------------------------------------------------------------------------------------
This source file is part of SWG:ANH (Star Wars Galaxies - A New Hope - Server Emulator)

For more information, visit http://www.swganh.com

Copyright (c) 2006 - 2010 The SWG:ANH Team*/

#ifndef ZONE_APP_H_
#define ZONE_APP_H_

#include <anh/application.h>
#include <anh/event_dispatcher/event_dispatcher.h>
#include <anh/scripting/scripting_manager.h>
#include <anh/component/object_manager.h>
#include <anh/component/object_builder.h>

namespace zone {
class ZoneApp : public anh::BaseApplication
{
public:
    /*! \brief Star up the Zone Application which controls everything on a planet.
    *
    *
    */
    explicit ZoneApp(int argc, char* argv[], std::list<std::string> config_files
        , std::shared_ptr<anh::event_dispatcher::EventDispatcherInterface> dispatcher
        , std::shared_ptr<anh::scripting::ScriptingManagerInterface> scripting_manager);

    // overrides
    virtual bool hasStarted() const { return started_; }
    virtual void onAddDefaultOptions_();
    virtual void onRegisterApp_();

    ~ZoneApp();
private:
    /* Disable the default constructor, copy constructor and assignment operators */
    ZoneApp();
    ZoneApp(const ZoneApp&);
    ZoneApp& operator=(const ZoneApp&);

    anh::component::ObjectBuilder object_builder_;
    anh::component::ObjectManager object_manager_;

};


} // end namespace zone
#endif // ZONE_APP_H_