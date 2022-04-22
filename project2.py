name = input("Enter desired name: ")
sex = input("Enter sex: ")
instances=[]
year=[]
totalnames=[]
popularity=[]
for i in range(1880,2018):
    files = (str("yob") + str(i) + str(".txt"))
    openfiles=open(files,'r')
    pop=0
    for line in openfiles:
        line = line.replace('\n','')
        data= line.split(',')
        pop_line=data[2]
        pop=pop+float(pop_line)
        if data[0]==name and data[1] == sex:
            year.append(i)
            instances.append(float(data[2]))
    totalnames.append(pop)
for e in range(0,len(instances)):
    popularity.append(((instances[e])/(totalnames[e]))*100)
xi=sum(year)
n=len(year)
yi=sum(instances)
xi2=sum(year)
yi2=sum(popularity)
xavg1= xi/n
yavg1=yi/n
xavg2=xi2/n
yavg2=yi2/n
xidiffxavgsquared=[]

xtimesy1=[]
xtimesy2=[]
for e in range(0,len(year)):
    xtimesy1.append(((year[e])-xavg1)*((instances[e])-yavg1))
    xtimesy2.append(((year[e])-xavg2)*((popularity[e])-yavg2))
    xidiffxavgsquared.append(((year[e])-xavg1)**2)
minsta=((sum(xtimesy1)/(sum(xidiffxavgsquared))))
mpop=(sum(xtimesy2)/(sum(xidiffxavgsquared)))

binsta=(yavg1-(minsta*(xavg1)))
bpop=(yavg2-(mpop*(xavg2)))

m1b1m2b2=[]
m1b1m2b2.append((minsta,binsta,mpop,bpop))
yearvinstances=[]
yearvpopularity=[]
yearinstancespopularity=[]
alldata=([year,instances,popularity
          ])

for e in range(0,len(year)):
    yearvinstances.append((year[e],instances[e]))
    yearvpopularity.append((year[e],popularity[e]))
    yearinstancespopularity.append((year[e],instances[e],popularity[e]))
    
    
         
myhandle=open('years.txt','w')
myhandle.write('Years\n')
for item in (year):
    myhandle.write("%s\n" % item)

myhandle=open('instances.txt','w')
myhandle.write('Instances\n')
for k in (instances):
    myhandle.write("%s\n" % k)

myhandle=open('popularity.txt','w')
myhandle.write('Popularity\n')
for item in (popularity):
    myhandle.write("%s\n" % item)

myhandle= open('m1b1m2b2.txt','w')  
myhandle.write('m1b1m2b2\n')
for item in m1b1m2b2:
    myhandle.write("%s\n %s\n %s\n %s\n" % item)
myhandle.close()
            
            

    
    
   
