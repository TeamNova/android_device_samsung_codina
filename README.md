CyanogenMod 11.0
=============================
Device Tree for Samsung Galaxy Ace 2
(GT-I8160)

How to build:
=============

- Make a workspace

  $ mkdir -p ~/cyanogenmod
  $ cd ~/cyanogenmod
  
- Do repo init & sync

  repo init -u https://github.com/TeamCanjica/android.git -b cm-11.0
  
  repo sync -j32

- Setup vendor
  
  ./vendor/cm/get-prebuilts
  
  . build/envsetup.sh

- Pull all not merged fixes from gerrit:

				cd art
				git fetch https://github.com/cernekee/android_art monitor-stack-v1
				git cherry-pick fc2ac71d0d9e147c607bff9371fe2ef25d8470af
				cd ..
				cd frameworks/av
				git fetch https://github.com/TeamCanjica/android_frameworks_av cm-11.0
				git cherry-pick 803bb5dd145630c0239a61bd4d58c3728f2dba57
				cd ..
				cd native
				git fetch https://github.com/TeamCanjica/android_frameworks_native cm-11.0
				git cherry-pick 8dd8f0c8b8872affa37a2f50953f07d4815f2fec
				cd ..
				git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_native refs/changes/11/59311/1
				git cherry-pick FETCH_HEAD
				cd base
				git fetch https://github.com/TeamCanjica/android_frameworks_base cm-11.0
				git cherry-pick bb9d91d07fdc20c2443c9668e2f20e392b25bac4
				cd ../..
				cd system/core
				git fetch https://github.com/TeamCanjica/android_system_core cm-11.0
				git cherry-pick 7bd81ee140c09066ede2ffab47da1a1c4e54e021
				git cherry-pick b6cb91b1f70c969bb0f818a24111c0ca055be590
				cd ..
				cd vold
				git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_vold refs/changes/15/56515/3
				git cherry-pick FETCH_HEAD
				cd ../..
				cd packages/services/Telephony
				git fetch https://github.com/TeamCanjica/android_packages_services_Telephony cm-11.0
				git cherry-pick fdf281fdabe5e7517eb96f2faf159bbcc74ae4a6
				cd ../../..
		
- Build CM11.0
  
  brunch codina


- Thanks : CyanogenMod, dh-harald, Sakura Droid, jereksel, diego-ch, frapeti, OliverG96, ekim.tecul
