{ callPackage, ogre1_10, ... } @ args:

callPackage ./. (args // {
  ogre = ogre1_10;
})

