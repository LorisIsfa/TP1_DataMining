BT=read.table('/Users/Loris/Desktop/data.txt')
nomVAR=read.table('/Users/Loris/Desktop/var.txt')
nomIND=read.table('/Users/Loris/Desktop/ind.txt')

test github test

names(BT)<-nomVAR$V1
rownames(BT)=nomIND$V1

moyVAR=apply(BT,2,sum)/28
C=BT-rep(1,28) %*% t(moyVAR)

ET=sqrt(apply(C^2,2,sum)/28)
Y=t(t(C)/ET)
t(Y) %*% Y/28 -> V

EIG=eigen(V)
attach(EIG)

valINERTIE=round(values,3)/sum(values)*100

bp=barplot(valINERTIE,ylab='Poids de l\'inertie totale',main='Parts d\'inertie',names.arg=c("1","2","3","4"))
text(bp,0,paste(valINERTIE,"%",sep=''),pos=3)

bp2=barplot(valcumINERTIE,ylab='Poids de l\'inertie totale',main='Parts d\'inertie cumulée',names.arg=c("1","2","3","4"))
text(bp2,0,paste(valcumINERTIE,"%",sep=''),pos=3)

i=1
if (DF3[i]>0){
	i=i+1
}
coude=i+1


plot(CP[,c(1,2)],axes=FALSE)
axis(1,-4:4,pos=0)
axis(2,-4:4,pos=0)

