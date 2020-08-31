#!/usr/bin/csh
rm -f ~/X ~/O ~/I ~/A
ln -s /dev/null ~/X
ln -s ~/PA2/inventory ~/I
ln -s ~/PA2/objects ~/O
ln -s ~/PA2/obj ~/A
cd
chmod 700 ~/PA2/start/e/e/ne/ne/ne
chmod 700 ~/PA2/start/e/e/ne/ne/ne/n
rm -r PA2
tar xvf PA2.tar > ~/X
cd ~/PA2/start
cat .d*
mv 9 1

while ( 1 )
  echo -n ">"
  set x = $<:q
  switch ( $x:q )
    case [news]:
    case [ns][ew]:
      cd $x
      if ($?) then
        head -n `ls [0-9]` .d*
	ls ???* | cat | tr \\n \ |sed 's/\<./ -e&/' | xargs fgrep ~/O/.alerts
	mv 9 1 &> ~/X
      else
      	if ( -d $x ) echo You do not have a key that can open this door
	if ( ! -d $x ) echo You cannot go that way.
      end
      breaksw
    case dig: 
      if ( ! -e ~/I/shovel ) then
        echo You have nothing with which to dig.
      else if ( ! -e .cpu ) then
        echo Digging here reveals nothing.
      else
        echo I think you found something.
        mv .cpu cpu; mv .board board; mv .card card
      end
      breaksw
    case quit:
      echo quit
      echo You have scored 0 out of a possible 90 points.
      exit
    default:
      echo $x:q
      (echo $x:q;ls ???*|sed ':a;$'\!'{N;ba;};s,\n, ,g')|sed -f ~/argprep > F
      echo "sed output was:" `cat F`
      echo -n "awk output was: "
      ls ~/I|awk -f ~/[BMDIJ]0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].PA5.awk
  endsw
end
