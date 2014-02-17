CarbonROM 4.4
=============================
Device Tree for Samsung Galaxy Ace 2
(GT-I8160)

How to build:
=============

- Make a workspace

  $ mkdir -p ~/carbon/system
  $ cd ~/carbon/system
  
- Do repo init & sync

  repo init https://github.com/TeamNova/Android.git -b carbon-4.4
  
  repo sync -j32

- Setup vendor
  
  . build/envsetup.sh

- Patch OMX:
  
    . ste_patch.sh
		
- Build Carbon 4.4
  
  brunch codina


- Thanks : Carbon Team, TeamCanjica, dh-harald, Sakura Droid, jereksel, diego-ch, frapeti, OliverG96, ekim.tecul
