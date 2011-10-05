CREATE TABLE ability_list (id BIGINT AUTO_INCREMENT NOT NULL, player_id BIGINT DEFAULT NULL, ability VARCHAR(255) NOT NULL, INDEX IDX_735EF84499E6F5DF (player_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE appearance (object_id BIGINT NOT NULL, scale DOUBLE PRECISION NOT NULL, gender INT NOT NULL, species VARCHAR(100) NOT NULL, customization_data LONGTEXT NOT NULL, PRIMARY KEY(object_id)) ENGINE = InnoDB;
CREATE TABLE object (id BIGINT NOT NULL, scene_id INT DEFAULT NULL, parent_id BIGINT DEFAULT NULL, shared_template_string VARCHAR(255) NOT NULL, x_position DOUBLE PRECISION NOT NULL, y_position DOUBLE PRECISION NOT NULL, z_position DOUBLE PRECISION NOT NULL, x_orientation DOUBLE PRECISION NOT NULL, y_orientation DOUBLE PRECISION NOT NULL, z_orientation DOUBLE PRECISION NOT NULL, w_orientation DOUBLE PRECISION NOT NULL, complexity DOUBLE PRECISION NOT NULL, stf_name_file VARCHAR(255) NOT NULL, stf_name_string VARCHAR(255) NOT NULL, custom_name VARCHAR(255) NOT NULL, volume INT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, deleted_at DATETIME DEFAULT NULL, discr VARCHAR(255) NOT NULL, INDEX IDX_A8ADABEC166053B4 (scene_id), INDEX IDX_A8ADABEC727ACA70 (parent_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE building (id BIGINT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE cell (id BIGINT NOT NULL, cell_number INT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE command (id BIGINT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, character_ability VARCHAR(255) NOT NULL, script_hook VARCHAR(255) NOT NULL, fail_script_hook VARCHAR(255) NOT NULL, default_time INT NOT NULL, max_range_to_target INT NOT NULL, add_to_combat_queue TINYINT(1) NOT NULL, health_cost INT NOT NULL, health_cost_multiplier INT NOT NULL, action_cost INT NOT NULL, action_cost_multiplier INT NOT NULL, mind_cost INT NOT NULL, mind_cost_multiplier INT NOT NULL, force_cost INT NOT NULL, force_cost_multiplier INT NOT NULL, damage_multiplier INT NOT NULL, delay_multiplier INT NOT NULL, animation VARCHAR(255) NOT NULL, required_weapon_group INT NOT NULL, combat_spam VARCHAR(255) NOT NULL, trail1 INT NOT NULL, trail2 INT NOT NULL, health_hit_chance INT NOT NULL, action_hit_chance INT NOT NULL, mind_hit_chance INT NOT NULL, knockdown_chance INT NOT NULL, dizzy_chance INT NOT NULL, blind_chance INT NOT NULL, stun_chance INT NOT NULL, intimidate_chance INT NOT NULL, posture_down_chance INT NOT NULL, allow_in_locomotion BIGINT NOT NULL, allow_in_posture BIGINT NOT NULL, allow_in_state BIGINT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE creature (id BIGINT NOT NULL, owner_id BIGINT DEFAULT NULL, musician_id BIGINT DEFAULT NULL, bank_credits BIGINT NOT NULL, cash_credits BIGINT NOT NULL, posture BIGINT NOT NULL, faction_rank SMALLINT NOT NULL, scale DOUBLE PRECISION NOT NULL, battle_fatigue BIGINT NOT NULL, state BIGINT NOT NULL, acceleration_base DOUBLE PRECISION NOT NULL, acceleration_modifier DOUBLE PRECISION NOT NULL, speed_base DOUBLE PRECISION NOT NULL, speed_modifier DOUBLE PRECISION NOT NULL, run_speed DOUBLE PRECISION NOT NULL, slope_modifier_angle DOUBLE PRECISION NOT NULL, slope_modifier_percent DOUBLE PRECISION NOT NULL, walking_speed DOUBLE PRECISION NOT NULL, water_modifier_percent DOUBLE PRECISION NOT NULL, INDEX IDX_2A6C6AF47E3C61F9 (owner_id), INDEX IDX_2A6C6AF49523AA8A (musician_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE creatures_skills (creature_id BIGINT NOT NULL, skill_id BIGINT NOT NULL, INDEX IDX_56339608F9AB048 (creature_id), INDEX IDX_563396085585C142 (skill_id), PRIMARY KEY(creature_id, skill_id)) ENGINE = InnoDB;
CREATE TABLE draft_schematic_list (id BIGINT AUTO_INCREMENT NOT NULL, player_id BIGINT DEFAULT NULL, schematic VARCHAR(255) NOT NULL, INDEX IDX_4D38EF9B99E6F5DF (player_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE factory_crate (id BIGINT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE force_sensative_quest_list (id BIGINT AUTO_INCREMENT NOT NULL, player_id BIGINT DEFAULT NULL, quest_mask INT NOT NULL, completed TINYINT(1) NOT NULL, INDEX IDX_EA74336199E6F5DF (player_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE friend_list (id BIGINT AUTO_INCREMENT NOT NULL, player_id BIGINT DEFAULT NULL, friend_id BIGINT DEFAULT NULL, INDEX IDX_DEB224F899E6F5DF (player_id), INDEX IDX_DEB224F86A5458E8 (friend_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE hopper_item (id BIGINT AUTO_INCREMENT NOT NULL, installation_id BIGINT DEFAULT NULL, resource_id BIGINT DEFAULT NULL, quantity DOUBLE PRECISION NOT NULL, INDEX IDX_E6F7A6B9167B88B4 (installation_id), INDEX IDX_E6F7A6B989329D25 (resource_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE ignore_list (id BIGINT AUTO_INCREMENT NOT NULL, player_id BIGINT DEFAULT NULL, ignored_player_id BIGINT DEFAULT NULL, INDEX IDX_124ECE8C99E6F5DF (player_id), INDEX IDX_124ECE8CD7A43A0C (ignored_player_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE installation (id BIGINT NOT NULL, selected_resource_id BIGINT DEFAULT NULL, is_active TINYINT(1) NOT NULL, power_reserve DOUBLE PRECISION NOT NULL, power_cost DOUBLE PRECISION NOT NULL, max_extraction_rate DOUBLE PRECISION NOT NULL, current_extraction_rate DOUBLE PRECISION NOT NULL, current_hopper_size DOUBLE PRECISION NOT NULL, is_updating TINYINT(1) NOT NULL, condition_percentage INT NOT NULL, INDEX IDX_1CBA6AB1B006AEA3 (selected_resource_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE intangible (id BIGINT NOT NULL, stf_detail_file VARCHAR(255) NOT NULL, stf_detail_string VARCHAR(255) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE manufacture_schematic (id BIGINT NOT NULL, quantity INT NOT NULL, creator VARCHAR(255) NOT NULL, data_size DOUBLE PRECISION NOT NULL, customization VARCHAR(255) NOT NULL, customization_model VARCHAR(255) NOT NULL, prototype_model VARCHAR(255) NOT NULL, is_active TINYINT(1) NOT NULL, risk_factor DOUBLE PRECISION NOT NULL, is_ready TINYINT(1) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE mission (id BIGINT NOT NULL, waypoint_id BIGINT DEFAULT NULL, difficulty_level INT NOT NULL, start_position_x DOUBLE PRECISION NOT NULL, start_position_y DOUBLE PRECISION NOT NULL, start_position_z DOUBLE PRECISION NOT NULL, start_scene INT NOT NULL, creator VARCHAR(255) NOT NULL, reward INT NOT NULL, destination_position_x DOUBLE PRECISION NOT NULL, destination_position_y DOUBLE PRECISION NOT NULL, destination_position_z DOUBLE PRECISION NOT NULL, destination_scene INT NOT NULL, description_stf_file VARCHAR(255) NOT NULL, description_stf_name VARCHAR(255) NOT NULL, title_stf_file VARCHAR(255) NOT NULL, title_stf_name VARCHAR(255) NOT NULL, repeat_counter INT NOT NULL, mission_type VARCHAR(255) NOT NULL, target_name VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_9067F23C7BB1FD97 (waypoint_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE name_developer (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE namegen_firstname (id INT AUTO_INCREMENT NOT NULL, first_name VARCHAR(100) NOT NULL, species INT NOT NULL, gender INT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE namegen_lastname (id INT AUTO_INCREMENT NOT NULL, last_name VARCHAR(100) NOT NULL, species INT NOT NULL, gender INT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE name_profane (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE name_reserved (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE player (id BIGINT NOT NULL, profession_tag VARCHAR(255) NOT NULL, born_date DATE NOT NULL, total_playtime BIGINT NOT NULL, csr_tag SMALLINT NOT NULL, current_force INT NOT NULL, max_force INT NOT NULL, experimentation_enabled TINYINT(1) NOT NULL, crafting_stage INT NOT NULL, nearest_crafting_station BIGINT NOT NULL, experimentation_points INT NOT NULL, accomplishment_counter INT NOT NULL, current_language INT NOT NULL, current_stomach INT NOT NULL, max_stomach INT NOT NULL, current_drink INT NOT NULL, max_drink INT NOT NULL, jedi_state INT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE players_status_flags (player_id BIGINT NOT NULL, status_flag_id INT NOT NULL, INDEX IDX_9475E7A299E6F5DF (player_id), INDEX IDX_9475E7A2994F9360 (status_flag_id), PRIMARY KEY(player_id, status_flag_id)) ENGINE = InnoDB;
CREATE TABLE players_profile_flags (player_id BIGINT NOT NULL, profile_flag_id INT NOT NULL, INDEX IDX_52689ED599E6F5DF (player_id), INDEX IDX_52689ED542213A79 (profile_flag_id), PRIMARY KEY(player_id, profile_flag_id)) ENGINE = InnoDB;
CREATE TABLE player_account (id BIGINT AUTO_INCREMENT NOT NULL, reference_id BIGINT NOT NULL, max_characters INT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE player_accounts_players (player_id BIGINT NOT NULL, player_character_id BIGINT NOT NULL, INDEX IDX_AFDAB34199E6F5DF (player_id), UNIQUE INDEX UNIQ_AFDAB341910BEE57 (player_character_id), PRIMARY KEY(player_id, player_character_id)) ENGINE = InnoDB;
CREATE TABLE player_session (id BIGINT AUTO_INCREMENT NOT NULL, player INT NOT NULL, session_key VARCHAR(100) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE profile_flag (id INT AUTO_INCREMENT NOT NULL, label VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, flag INT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE quest_journal_list (id BIGINT AUTO_INCREMENT NOT NULL, player_id BIGINT DEFAULT NULL, quest_owner_id BIGINT DEFAULT NULL, name VARCHAR(255) NOT NULL, active_step_bitmask INT NOT NULL, completed_step_bitmask INT NOT NULL, completed TINYINT(1) NOT NULL, INDEX IDX_DF1EF7BA99E6F5DF (player_id), INDEX IDX_DF1EF7BA9F66DE5C (quest_owner_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE resource (id BIGINT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, type INT NOT NULL, er SMALLINT NOT NULL, cr SMALLINT NOT NULL, cd SMALLINT NOT NULL, dr SMALLINT NOT NULL, fl SMALLINT NOT NULL, hr SMALLINT NOT NULL, ma SMALLINT NOT NULL, op SMALLINT NOT NULL, sr SMALLINT NOT NULL, ut SMALLINT NOT NULL, pe SMALLINT NOT NULL, spawn_date DATETIME NOT NULL, expiration_date DATETIME NOT NULL, active TINYINT(1) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE resource_container (id BIGINT NOT NULL, resource_id BIGINT DEFAULT NULL, current_quantity INT NOT NULL, max_quantity INT NOT NULL, INDEX IDX_6F6BBF8489329D25 (resource_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE scene (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, label VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, terrain VARCHAR(255) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE schematic_customization (id BIGINT AUTO_INCREMENT NOT NULL, manufacture_schematic_id BIGINT DEFAULT NULL, name VARCHAR(255) NOT NULL, pallet_selection INT NOT NULL, pallet_start_index INT NOT NULL, pallet_end_index INT NOT NULL, INDEX IDX_1AF7B2664DE6846C (manufacture_schematic_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE schematic_experiment (id BIGINT AUTO_INCREMENT NOT NULL, manufacture_schematic_id BIGINT DEFAULT NULL, stf_file VARCHAR(255) NOT NULL, stf_name VARCHAR(255) NOT NULL, value DOUBLE PRECISION NOT NULL, offset DOUBLE PRECISION NOT NULL, size DOUBLE PRECISION NOT NULL, max_value DOUBLE PRECISION NOT NULL, INDEX IDX_25B156D74DE6846C (manufacture_schematic_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE schematic_property (id BIGINT AUTO_INCREMENT NOT NULL, manufacture_schematic_id BIGINT DEFAULT NULL, stf_file VARCHAR(255) NOT NULL, stf_name VARCHAR(255) NOT NULL, INDEX IDX_C21D7FB14DE6846C (manufacture_schematic_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE schematic_slot (id BIGINT AUTO_INCREMENT NOT NULL, manufacture_schematic_id BIGINT DEFAULT NULL, stf_file VARCHAR(255) NOT NULL, stf_name VARCHAR(255) NOT NULL, type INT NOT NULL, ingredient BIGINT NOT NULL, quantity INT NOT NULL, clean INT NOT NULL, INDEX IDX_1B0D2FAB4DE6846C (manufacture_schematic_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE ship (id BIGINT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE skill (id BIGINT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, god_only TINYINT(1) NOT NULL, is_title TINYINT(1) NOT NULL, is_profession TINYINT(1) NOT NULL, money_required INT NOT NULL, points_required INT NOT NULL, xp_type VARCHAR(255) NOT NULL, xp_cost INT NOT NULL, xp_cap INT NOT NULL, jedi_state_required INT NOT NULL, is_searchable TINYINT(1) NOT NULL, is_badge TINYINT(1) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE skills_skill_mods (skill_id BIGINT NOT NULL, skillmod_id BIGINT NOT NULL, INDEX IDX_E43191855585C142 (skill_id), INDEX IDX_E43191859C9E5E6D (skillmod_id), PRIMARY KEY(skill_id, skillmod_id)) ENGINE = InnoDB;
CREATE TABLE skills_commands (skill_id BIGINT NOT NULL, command_id BIGINT NOT NULL, INDEX IDX_B26E8E4F5585C142 (skill_id), INDEX IDX_B26E8E4F33E1689A (command_id), PRIMARY KEY(skill_id, command_id)) ENGINE = InnoDB;
CREATE TABLE skills_required_skills (skill_id BIGINT NOT NULL, required_skill_id BIGINT NOT NULL, INDEX IDX_C6D178BB5585C142 (skill_id), INDEX IDX_C6D178BBCEC0E2D5 (required_skill_id), PRIMARY KEY(skill_id, required_skill_id)) ENGINE = InnoDB;
CREATE TABLE skills_preclusion_skills (skill_id BIGINT NOT NULL, preclusion_skill_id BIGINT NOT NULL, INDEX IDX_F89ED6FB5585C142 (skill_id), INDEX IDX_F89ED6FBB334A428 (preclusion_skill_id), PRIMARY KEY(skill_id, preclusion_skill_id)) ENGINE = InnoDB;
CREATE TABLE skill_mod (id BIGINT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE species (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, health_min INT NOT NULL, health_max INT NOT NULL, strength_min INT NOT NULL, strength_max INT NOT NULL, constitution_min INT NOT NULL, constitution_max INT NOT NULL, action_min INT NOT NULL, action_max INT NOT NULL, quickness_min INT NOT NULL, quickness_max INT NOT NULL, stamina_min INT NOT NULL, stamina_max INT NOT NULL, mind_min INT NOT NULL, mind_max INT NOT NULL, focus_min INT NOT NULL, focus_max INT NOT NULL, willpower_min INT NOT NULL, willpower_max INT NOT NULL, total INT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE starting_location (location_id INT AUTO_INCREMENT NOT NULL, scene_id INT DEFAULT NULL, location VARCHAR(100) NOT NULL, x DOUBLE PRECISION NOT NULL, y DOUBLE PRECISION NOT NULL, z DOUBLE PRECISION NOT NULL, description VARCHAR(100) NOT NULL, radius INT NOT NULL, heading INT NOT NULL, INDEX IDX_6D2A488E166053B4 (scene_id), PRIMARY KEY(location_id)) ENGINE = InnoDB;
CREATE TABLE status_flag (id INT AUTO_INCREMENT NOT NULL, label VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, flag INT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE tangible (id BIGINT NOT NULL, customization VARCHAR(255) NOT NULL, options_bitmask INT NOT NULL, incap_timer INT NOT NULL, condition_damage INT NOT NULL, max_condition INT NOT NULL, is_moveable TINYINT(1) NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE tangibles_defenders (tangible_id BIGINT NOT NULL, INDEX IDX_C6524BE2C7FE2A7F (tangible_id), PRIMARY KEY(tangible_id)) ENGINE = InnoDB;
CREATE TABLE waypoint (id BIGINT NOT NULL, player_id BIGINT DEFAULT NULL, is_active TINYINT(1) NOT NULL, name VARCHAR(255) NOT NULL, color SMALLINT NOT NULL, INDEX IDX_B3DC588199E6F5DF (player_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE weapon (id BIGINT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE xp_list (id BIGINT AUTO_INCREMENT NOT NULL, player_id BIGINT DEFAULT NULL, xp_type_id INT DEFAULT NULL, value INT NOT NULL, INDEX IDX_960633ED99E6F5DF (player_id), INDEX IDX_960633ED2291DC48 (xp_type_id), PRIMARY KEY(id)) ENGINE = InnoDB;
CREATE TABLE xp_type (id INT AUTO_INCREMENT NOT NULL, label VARCHAR(255) NOT NULL, name VARCHAR(255) NOT NULL, cap INT NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB;
ALTER TABLE ability_list ADD CONSTRAINT FK_735EF84499E6F5DF FOREIGN KEY (player_id) REFERENCES player(id);
ALTER TABLE appearance ADD CONSTRAINT FK_AAB38290232D562B FOREIGN KEY (object_id) REFERENCES object(id);
ALTER TABLE object ADD CONSTRAINT FK_A8ADABEC166053B4 FOREIGN KEY (scene_id) REFERENCES scene(id);
ALTER TABLE object ADD CONSTRAINT FK_A8ADABEC727ACA70 FOREIGN KEY (parent_id) REFERENCES object(id);
ALTER TABLE building ADD CONSTRAINT FK_E16F61D4BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE cell ADD CONSTRAINT FK_CB8787E2BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE creature ADD CONSTRAINT FK_2A6C6AF47E3C61F9 FOREIGN KEY (owner_id) REFERENCES creature(id);
ALTER TABLE creature ADD CONSTRAINT FK_2A6C6AF49523AA8A FOREIGN KEY (musician_id) REFERENCES creature(id);
ALTER TABLE creature ADD CONSTRAINT FK_2A6C6AF4BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE creatures_skills ADD CONSTRAINT FK_56339608F9AB048 FOREIGN KEY (creature_id) REFERENCES creature(id) ON DELETE CASCADE;
ALTER TABLE creatures_skills ADD CONSTRAINT FK_563396085585C142 FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE;
ALTER TABLE draft_schematic_list ADD CONSTRAINT FK_4D38EF9B99E6F5DF FOREIGN KEY (player_id) REFERENCES player(id);
ALTER TABLE factory_crate ADD CONSTRAINT FK_EDBCAC47BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE force_sensative_quest_list ADD CONSTRAINT FK_EA74336199E6F5DF FOREIGN KEY (player_id) REFERENCES player(id);
ALTER TABLE friend_list ADD CONSTRAINT FK_DEB224F899E6F5DF FOREIGN KEY (player_id) REFERENCES player(id);
ALTER TABLE friend_list ADD CONSTRAINT FK_DEB224F86A5458E8 FOREIGN KEY (friend_id) REFERENCES player(id);
ALTER TABLE hopper_item ADD CONSTRAINT FK_E6F7A6B9167B88B4 FOREIGN KEY (installation_id) REFERENCES installation(id);
ALTER TABLE hopper_item ADD CONSTRAINT FK_E6F7A6B989329D25 FOREIGN KEY (resource_id) REFERENCES resource(id);
ALTER TABLE ignore_list ADD CONSTRAINT FK_124ECE8C99E6F5DF FOREIGN KEY (player_id) REFERENCES player(id);
ALTER TABLE ignore_list ADD CONSTRAINT FK_124ECE8CD7A43A0C FOREIGN KEY (ignored_player_id) REFERENCES player(id);
ALTER TABLE installation ADD CONSTRAINT FK_1CBA6AB1B006AEA3 FOREIGN KEY (selected_resource_id) REFERENCES resource(id);
ALTER TABLE installation ADD CONSTRAINT FK_1CBA6AB1BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE intangible ADD CONSTRAINT FK_BF03160DBF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE manufacture_schematic ADD CONSTRAINT FK_51DC8E01BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE mission ADD CONSTRAINT FK_9067F23C7BB1FD97 FOREIGN KEY (waypoint_id) REFERENCES waypoint(id);
ALTER TABLE mission ADD CONSTRAINT FK_9067F23CBF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE player ADD CONSTRAINT FK_98197A65BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE players_status_flags ADD CONSTRAINT FK_9475E7A299E6F5DF FOREIGN KEY (player_id) REFERENCES player(id);
ALTER TABLE players_status_flags ADD CONSTRAINT FK_9475E7A2994F9360 FOREIGN KEY (status_flag_id) REFERENCES status_flag(id);
ALTER TABLE players_profile_flags ADD CONSTRAINT FK_52689ED599E6F5DF FOREIGN KEY (player_id) REFERENCES player(id);
ALTER TABLE players_profile_flags ADD CONSTRAINT FK_52689ED542213A79 FOREIGN KEY (profile_flag_id) REFERENCES profile_flag(id);
ALTER TABLE player_accounts_players ADD CONSTRAINT FK_AFDAB34199E6F5DF FOREIGN KEY (player_id) REFERENCES player_account(id);
ALTER TABLE player_accounts_players ADD CONSTRAINT FK_AFDAB341910BEE57 FOREIGN KEY (player_character_id) REFERENCES player(id);
ALTER TABLE quest_journal_list ADD CONSTRAINT FK_DF1EF7BA99E6F5DF FOREIGN KEY (player_id) REFERENCES player(id);
ALTER TABLE quest_journal_list ADD CONSTRAINT FK_DF1EF7BA9F66DE5C FOREIGN KEY (quest_owner_id) REFERENCES player(id);
ALTER TABLE resource_container ADD CONSTRAINT FK_6F6BBF8489329D25 FOREIGN KEY (resource_id) REFERENCES resource(id);
ALTER TABLE resource_container ADD CONSTRAINT FK_6F6BBF84BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE schematic_customization ADD CONSTRAINT FK_1AF7B2664DE6846C FOREIGN KEY (manufacture_schematic_id) REFERENCES manufacture_schematic(id);
ALTER TABLE schematic_experiment ADD CONSTRAINT FK_25B156D74DE6846C FOREIGN KEY (manufacture_schematic_id) REFERENCES manufacture_schematic(id);
ALTER TABLE schematic_property ADD CONSTRAINT FK_C21D7FB14DE6846C FOREIGN KEY (manufacture_schematic_id) REFERENCES manufacture_schematic(id);
ALTER TABLE schematic_slot ADD CONSTRAINT FK_1B0D2FAB4DE6846C FOREIGN KEY (manufacture_schematic_id) REFERENCES manufacture_schematic(id);
ALTER TABLE ship ADD CONSTRAINT FK_FA30EB24BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE skills_skill_mods ADD CONSTRAINT FK_E43191855585C142 FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE;
ALTER TABLE skills_skill_mods ADD CONSTRAINT FK_E43191859C9E5E6D FOREIGN KEY (skillmod_id) REFERENCES skill_mod(id) ON DELETE CASCADE;
ALTER TABLE skills_commands ADD CONSTRAINT FK_B26E8E4F5585C142 FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE;
ALTER TABLE skills_commands ADD CONSTRAINT FK_B26E8E4F33E1689A FOREIGN KEY (command_id) REFERENCES command(id) ON DELETE CASCADE;
ALTER TABLE skills_required_skills ADD CONSTRAINT FK_C6D178BB5585C142 FOREIGN KEY (skill_id) REFERENCES skill(id);
ALTER TABLE skills_required_skills ADD CONSTRAINT FK_C6D178BBCEC0E2D5 FOREIGN KEY (required_skill_id) REFERENCES skill(id);
ALTER TABLE skills_preclusion_skills ADD CONSTRAINT FK_F89ED6FB5585C142 FOREIGN KEY (skill_id) REFERENCES skill(id);
ALTER TABLE skills_preclusion_skills ADD CONSTRAINT FK_F89ED6FBB334A428 FOREIGN KEY (preclusion_skill_id) REFERENCES skill(id);
ALTER TABLE starting_location ADD CONSTRAINT FK_6D2A488E166053B4 FOREIGN KEY (scene_id) REFERENCES scene(id);
ALTER TABLE tangible ADD CONSTRAINT FK_80F8D49EBF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE tangibles_defenders ADD CONSTRAINT FK_C6524BE2C7FE2A7F FOREIGN KEY (tangible_id) REFERENCES tangible(id) ON DELETE CASCADE;
ALTER TABLE waypoint ADD CONSTRAINT FK_B3DC588199E6F5DF FOREIGN KEY (player_id) REFERENCES player(id);
ALTER TABLE waypoint ADD CONSTRAINT FK_B3DC5881BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE weapon ADD CONSTRAINT FK_6933A7E6BF396750 FOREIGN KEY (id) REFERENCES object(id) ON DELETE CASCADE;
ALTER TABLE xp_list ADD CONSTRAINT FK_960633ED99E6F5DF FOREIGN KEY (player_id) REFERENCES player(id);
ALTER TABLE xp_list ADD CONSTRAINT FK_960633ED2291DC48 FOREIGN KEY (xp_type_id) REFERENCES xp_type(id)
