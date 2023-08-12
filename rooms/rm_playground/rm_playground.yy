{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_playground",
  "creationCodeFile": "${project_dir}/rooms/rm_tutorial/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_280768E3_1_1_1_1_1","path":"rooms/rm_playground/rm_playground.yy",},
    {"name":"inst_6264CEF4","path":"rooms/rm_playground/rm_playground.yy",},
    {"name":"inst_75402294","path":"rooms/rm_playground/rm_playground.yy",},
    {"name":"inst_7AAAAA22","path":"rooms/rm_playground/rm_playground.yy",},
    {"name":"inst_1EFB54B0","path":"rooms/rm_playground/rm_playground.yy",},
    {"name":"inst_72C382C4","path":"rooms/rm_playground/rm_playground.yy",},
    {"name":"inst_3478701F","path":"rooms/rm_playground/rm_playground.yy",},
    {"name":"inst_18217D01","path":"rooms/rm_playground/rm_playground.yy",},
    {"name":"inst_6CE41D86","path":"rooms/rm_playground/rm_playground.yy",},
    {"name":"inst_2E84CCA9","path":"rooms/rm_playground/rm_playground.yy",},
    {"name":"inst_6E6DF678","path":"rooms/rm_playground/rm_playground.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"controllers","depth":0,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7AAAAA22","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_player_creator","path":"objects/obj_player_creator/obj_player_creator.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_player_creator","path":"objects/obj_player_creator/obj_player_creator.yy",},"propertyId":{"name":"player_x_start_pos","path":"objects/obj_player_creator/obj_player_creator.yy",},"value":"88",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_player_creator","path":"objects/obj_player_creator/obj_player_creator.yy",},"propertyId":{"name":"player_y_start_pos","path":"objects/obj_player_creator/obj_player_creator.yy",},"value":"136",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":88.0,"y":136.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"checkpoints","depth":100,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6264CEF4","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_checkpoint","path":"objects/obj_checkpoint/obj_checkpoint.yy",},"properties":[],"rotation":0.0,"scaleX":4.0,"scaleY":5.0,"x":88.0,"y":136.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"camera","depth":200,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"camera_masks","depth":300,"effectEnabled":true,"effectType":null,"gridX":320,"gridY":180,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_280768E3_1_1_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_camera_mask","path":"objects/obj_camera_mask/obj_camera_mask.yy",},"properties":[],"rotation":0.0,"scaleX":3.0,"scaleY":1.0,"x":0.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"default_colliders","depth":400,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1EFB54B0","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_default_collider","path":"objects/obj_default_collider/obj_default_collider.yy",},"properties":[],"rotation":0.0,"scaleX":120.00001,"scaleY":5.0,"x":0.0,"y":136.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_72C382C4","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_default_collider","path":"objects/obj_default_collider/obj_default_collider.yy",},"properties":[],"rotation":0.0,"scaleX":4.0,"scaleY":11.0,"x":216.0,"y":48.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":false,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"foreground_particles_1","depth":500,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"foreground_props_1","depth":600,"effectEnabled":true,"effectType":"none","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":225,"SerialiseWidth":400,"TileCompressedData":[
-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-81080,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_jungle_foreground_props","path":"tilesets/ts_jungle_foreground_props/ts_jungle_foreground_props.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"player_dust_particles","depth":700,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"foreground_tiles_1","depth":800,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":225,"SerialiseWidth":400,"TileCompressedData":[
-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-120,0,-280,-2147483648,-27,0,4,78,2,1,85,-89,0,-280,-2147483648,-27,0,4,1073741832,268435465,9,3,-89,0,-280,-2147483648,-27,0,4,1342177288,268435476,2,3,-89,0,-280,-2147483648,-27,0,4,4,268435476,27,3,-89,0,-280,-2147483648,-27,0,4,15,268435483,27,3,-89,0,-280,-2147483648,-27,0,4,3,268435483,1342177300,22,-89,0,-280,-2147483648,-27,0,4,3,268435483,1879048202,11,-89,0,-280,-2147483648,-27,0,4,3,268435483,805306378,1073741835,-89,0,-280,-2147483648,-27,0,4,2,268435483,20,22,-89,0,-280,-2147483648,-27,0,4,2,268435483,27,4,-89,0,-280,-2147483648,-27,0,4,2,268435483,27,4,-89,0,-280,-2147483648,8,1,2,2,1,1,2,1073741826,2,-3,3,-2,1,6,268435467,10,9,9,268435465,268435465,-4,4,-2,1,-3,2,13,268435483,27,4,268435473,17,16,268435472,15,268435471,1073741846,805306390,536870934,3,-9,1,-5,3,-65,1,-280,-2147483648,-2,6,2,1879048219,1879048212,-5,1879048219,-2,1879048212,-2,1879048219,2,805306378,536870923,-3,1879048219,-2,1879048212,-8,1879048219,-2,6,5,536870932,805306385,536870929,1342177307,1342177307,-5,1879048219,-4,1342177307,-7,1879048219,-4,1342177307,-11,1879048219,-54,6,-280,-2147483648,-13,6,1,268435476,-8,6,2,62,1073741872,-96,6,-280,-2147483648,-5,6,2,1073741844,1879048219,-8,6,-2,69,-6,6,1,1879048261,-96,6,-280,-2147483648,-16,6,1,805306423,-103,6,-280,-2147483648,-120,6,-81080,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_playground_foreground_1","path":"tilesets/ts_playground_foreground_1/ts_playground_foreground_1.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"player","depth":900,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"misc","depth":1000,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3478701F","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_direct","path":"objects/obj_direct/obj_direct.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":160.0,"y":112.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_18217D01","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_direct","path":"objects/obj_direct/obj_direct.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":360.0,"y":112.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6CE41D86","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_direct","path":"objects/obj_direct/obj_direct.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":488.0,"y":48.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2E84CCA9","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_direct","path":"objects/obj_direct/obj_direct.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":616.0,"y":104.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6E6DF678","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_direct","path":"objects/obj_direct/obj_direct.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":752.0,"y":48.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"teleporters","depth":1100,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_75402294","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_teleporter","path":"objects/obj_teleporter/obj_teleporter.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_teleporter","path":"objects/obj_teleporter/obj_teleporter.yy",},"propertyId":{"name":"xto","path":"objects/obj_teleporter/obj_teleporter.yy",},"value":"1476",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_teleporter","path":"objects/obj_teleporter/obj_teleporter.yy",},"propertyId":{"name":"yto","path":"objects/obj_teleporter/obj_teleporter.yy",},"value":"264",},
          ],"rotation":0.0,"scaleX":2.0,"scaleY":4.0,"x":88.0,"y":136.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"light_sources_2","assets":[],"depth":1200,"effectEnabled":true,"effectType":"none","gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"background_particles_2","depth":1300,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"background_particles_1","depth":1400,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"background_props_1","depth":1500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":225,"SerialiseWidth":400,"TileCompressedData":[
-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-283,-2147483648,-117,0,-81083,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_jungle_foreground_props","path":"tilesets/ts_jungle_foreground_props/ts_jungle_foreground_props.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"background_tiles_1","depth":1600,"effectEnabled":true,"effectType":"none","gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":225,"SerialiseWidth":400,"TileCompressedData":[
-113,0,-287,-2147483648,-113,0,-287,-2147483648,-113,0,-287,-2147483648,-113,0,-287,-2147483648,-113,0,-287,-2147483648,-113,0,-287,-2147483648,-113,0,-287,-2147483648,-113,0,-287,-2147483648,-3,1,1,85,-109,0,-287,-2147483648,-3,6,4,12,1,1,85,-19,0,2,78,85,-85,0,-287,-2147483648,-6,6,1,12,-4,1,1,85,-14,0,2,15,22,-85,0,-287,-2147483648,-3,6,4,5,8,8,19,-4,6,3,12,1,85,-10,0,4,78,1,26,22,-85,0,-287,-2147483648,-3,6,4,22,0,0,15,-6,6,1,22,-10,0,4,15,6,6,22,-85,0,-287,-2147483648,9,6,5,8,99,0,0,92,8,19,-4,6,1,22,-8,0,6,78,1,26,6,6,22,-85,0,-287,-2147483648,2,6,22,-6,0,1,15,-4,6,3,12,1,85,-6,0,6,15,6,6,5,8,99,-85,0,-287,-2147483648,2,8,99,-6,0,1,15,-6,6,4,22,0,0,78,-3,1,4,26,6,6,22,-87,0,-287,-2147483648,-8,0,1,15,-6,6,4,12,1,1,26,-6,6,1,22,-87,0,-287,-2147483648,-8,0,1,92,-7,8,1,19,-8,6,1,22,-87,0,-287,-2147483648,-16,0,1,92,-8,8,1,99,-87,0,-287,-2147483648,-113,0,-287,-2147483648,-113,0,-287,-2147483648,-113,0,-287,-2147483648,-113,0,-287,-2147483648,-12,0,-388,-2147483648,-12,0,-388,-2147483648,-11,0,-79989,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_playground_background_1","path":"tilesets/ts_playground_background_1/ts_playground_background_1.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":1700,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 1800,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 3200,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":900,"hspeed":-1,"hview":180,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1600,"wview":320,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}