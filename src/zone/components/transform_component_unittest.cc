/*
 This file is part of SWGANH. For more information, visit http://swganh.com
 
 Copyright (c) 2011 ANH Studios

 SWGANH is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 SWGANH is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with SWGANH.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <gtest/gtest.h>

#include <boost/filesystem.hpp>

#include <anh/component/object_builder.h>
#include <anh/component/object_manager.h>
#include <zone/components/transform_component.h>

using namespace boost::filesystem;
using namespace zone::components;
using namespace std;

#define TEST_OBJECT_ID 0xDEADBEEF

/// This is used to test the Transform Component
class TestTransformComponent : public testing::Test {
public:
    ObjectBuilder object_builder;
    
    shared_ptr<TransformComponentInterface> transform_comp;
    shared_ptr<TransformMessage> trans;
protected:
    virtual void SetUp();
    virtual void TearDown();
};
void TestTransformComponent::SetUp() {
    create_directory("test_components");
    ofstream of("test_components/test-pos.xml");
    // simple template
    of << "<object name=\"test_pos\">" <<endl;
    of << "<component type=\"TransformComponent\">" <<endl;
	of << "<parent_id>0</parent_id><position><x>324.4</x><y>231.13</y><z>0.0</z></position>" <<endl;
    of << "<rotation><x>156</x><y>131</y><z>14</z><w>5</w></rotation><speed>3</speed>" <<endl;
    of << "</component></object>" <<endl;
    // now we can init
    object_builder.Init("test_components");
    object_builder.RegisterCreator("TransformComponent", [=](const ObjectId& id){ return shared_ptr<TransformComponentInterface>( new TransformComponent(id) ); });
    if (object_builder.BuildObject(TEST_OBJECT_ID, "test_pos") != BUILD_FAILED) {
        transform_comp = gObjectManager.QueryInterface<TransformComponentInterface>(TEST_OBJECT_ID, "TransformComponent");
    }
}
void TestTransformComponent::TearDown() {
    object_builder.Deinit();
    remove_all("test_components");
}
TEST_F(TestTransformComponent, LoadPosition) {
    float x = transform_comp->position().x;
    EXPECT_EQ(324.4f, x);
}
TEST_F(TestTransformComponent, LoadRotation) {
    float w = transform_comp->rotation().w;
    EXPECT_EQ(5.0f, w);
}
TEST_F(TestTransformComponent, SendTransformMessage){
    glm::vec3 pos(1100,200,35);
    glm::vec4 rot(0,0,0,1);
    trans = make_shared<TransformMessage>(0, pos, rot, 5.0f);
    transform_comp->HandleMessage(trans);
    float x = transform_comp->position().x;
    EXPECT_EQ(1100, x);
}