ls ~/O/$* >& ~/X && touch rmrm$*;

( ( ls ~/O/$* >& ~/X ) || (echo "I do not know what that is."; touch without ; touch did) )
#no input_file in objects == /O ,and make without and print sentence 
( (ls without >& ~/X) || ( ( ls ~/I/$* >& ~/X ) || (echo "You do not have that." ; touch without ; touch did) ) )

( ls without >& ~/X ) || ( (ls rmrmfood >& ~/X) &&  ( (ls `pwd`/.key  >& ~/X) && (echo -e "Done. \nThe bear takes the food and runs away with it. He left something behind." ) && ( rm ~/I/food 2> ~/X && rm `pwd`/bear 2> ~/X ) && (mv `pwd`/.key `pwd`/key) ; rm rmrmfood >& ~/X) )

( ls rmrmemerald  >& ~/X) && ( mv ~/I/bracelet `pwd -P`  && mv ~/I/emerald `pwd -P` ; rm rmrmemerald ; echo "Done") 
( ls rmrmbracelet >& ~/X) && (  mv ~/I/bracelet `pwd -P`  && mv ~/I/emerald `pwd -P` ; rm rmrmbracelet ; echo "Done")
( ls rmrmcard     >& ~/X) && ( mv ~/I/card `pwd -P` && mv ~/I/cpu `pwd -P` && mv ~/I/board `pwd -P`; rm rmrmcard ; echo "Done")
( ls rmrmcpu      >& ~/X) && ( mv ~/I/card `pwd -P` && mv ~/I/cpu `pwd -P` && mv ~/I/board `pwd -P`; rm rmrmcpu ; echo "Done")
( ls rmrmboard    >& ~/X) && ( mv ~/I/card `pwd -P` && mv ~/I/cpu `pwd -P` && mv ~/I/board `pwd -P`; rm rmrmboard ; echo "Done")
( ls rmrmkey      >& ~/X) && ( mv ~/I/key `pwd -P` ; chmod 600 ~/PA2/start/e/e/ne/ne/ne ; rm rmrmkey ; echo "Done")
ls without >& ~/X && ( rm without >& ~/X ; exit; )
mv ~/I/$* `pwd -P` >& ~/X && echo "Done";
rm rmrm$* >& ~/X;
rm did >& ~/X;











