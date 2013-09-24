CC = g++
HADOOP_INSTALL = /home/resys/var/hadoop-1.1.2/
PLATFORM = Linux-amd64-64
CPPFLAGS = -I$(HADOOP_INSTALL)/c++/$(PLATFORM)/include
 
wordcount : wordcount.cpp
	$(CC) $(CPPFLAGS) $< -Wall -L$(HADOOP_INSTALL)/c++/$(PLATFORM)/lib -lcrypto -lssl -lhadooppipes -lhadooputils -lpthread -g -O2 -o $@

clean :
	rm -fr wordcount
