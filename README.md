1.bash: line 3: /home/guogh/work/pandorBox-SDK-mt7620/staging_dir/host/bin/usign: No such file or directory

	提示找不到usign可执行文件，直接从openwrt-SDK中去copy一份usign，即可解决。
 	fix：2017-07-06 14:54:50 

2.Cannot open file '/home/guogh/work/pandorBox-SDK-mt7620/key-build' for reading

	提示打不开key-build
	1）try ./staging_dir/host/bin/usign -G -s ./key-build -p ./key-build.pub -c "Local build key"  to build key manually.
	2）Or make menuconfig, disable global building settings | Cryptographically sign package lists 
	fix：by 1   2017-07-06 14:58:05 
3.git init 保存到github
	2017-07-06 14:58:56 
	

4.创建dev分支。
	2017-07-06 15:50:20 

