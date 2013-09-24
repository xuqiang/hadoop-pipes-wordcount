如果出现"Server failed to authenticate"错误，解决方法如下

1.  添加环境变量
export LIB=-lcrypto

2. 检查$HADOOP_HOME/src/contrib/gridmix/src/java/org/apache/hadoop/mapred/gridmix/Gridmix.java

	-  private <T> String getEnumValues(Enum<? extends T>[] e) {  
    +  private String getEnumValues(Enum<?>[] e) {  
         StringBuilder sb = new StringBuilder();  
        String sep = "";  
    -    for (Enum<? extends T> v : e) {  
    +    for (Enum<?> v : e) {  
           sb.append(sep);  
			sb.append(v.name());  
			sep = "|"; 

3. 重新安装hadoop utils和pipes
    
安装c++/utils,到$(HADOOP_HOME)/src/c++/utils运行如下命令:
    
    ./configure && make install

安装c++/pipes,到$(HADOOP_HOME)/src/c++/pipes运行如下命令:
    
    ./configure && make install

安装pipe时可能出现

    error: ‘sleep’ was not declared in this scope

错误，参考这个https://issues.apache.org/jira/browse/MAPREDUCE-4383 重新编译即可
4. 替换lib
    
将$(HADOOP_HOME)/src/c++/install下的东西替换到$HADOOP_HOME/c++即可


5. makefile中使用-L$(HADOOP_HOME)/src/c++/install/lib -lhadooputils -lhadooppipes -lcrypto -lssl -lpthread
