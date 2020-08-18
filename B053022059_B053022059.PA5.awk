#!/usr/bin/awk -f
BEGIN{
count=1;i=1
}
{
	_list[$0]=$0
	count++;
}

END{
	getline < "F"
	string = $0;
	act = $1;
	obj = $2;
	if (act == "I" || act == "You")
		{
		printf("%s\n",string);
		}

	if (act == "c" || act == "g")
		{
		printf("%s\n",string);
		}
	if ( act == "p")
		{
			if (index (string,"@"))
			{
				if($2 in _list)
					{
					sub ("@","",string)
					}
				else
					printf("You don't have that.\n");
				if($4 in _list)
					{
					sub ("@","",string)
					printf("%s\n",string);
					}
				else
					printf("That indirect object is not here.\n");
			}
			else
			{
				for(i=1;i<count;i++)
				if($2 in _list)
					printf("%s\n",string);
				else
					printf("You don't have that.\n");
			}
		}
	if (act == "d" || act == "e" )
		{
		for(i=1;i<count;i++)
			if(obj in _list)
				printf("%s\n",string);
			else
				printf("You don't have that.\n");
		
		}
	if (act == "s" )
	{
		if (index (string,"@"))
		{
			if($2 in _list)
				{
				sub ("@","",string)
				printf("%s\n",string);
				}
			else
				{
					printf("You don't have that.\n");
				}
		}
		else if ( obj == "tree" || obj == "trees" )
			printf("%s\n",string);
		else
		{
			for(i=1;i<count;i++)
			if(obj in _list)
				printf("%s\n",string);
			else
				printf("You don't have that.\n",string);

		}
	}
	if (act == "x" )
	{
		if (index (string,"@"))
		{
			if($2 in _list)
				{				
				sub ("@","",string)
				printf("%s\n",string);
				}
			else
				printf("I don't see that here.\n");
		}
		else
		{
			printf("%s\n",string);
		}

	}
}