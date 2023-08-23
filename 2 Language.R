Word <- function(x) {
  if(x=="significantly") {sample(c("materially","significanrly","materially","significanrly","greatly"),1)} else
    if(x=="slightly") {sample(c("slightly","slightly","marginally","moderately"),1)} else
      if(x=="increased") {sample(c("increased","increased","increased","risen","risen","jumped","grown","gone up"),1)}   else
        if(x=="increase") {sample(c("increase","increase","increase","rise","jump","lift"),1)} else
          if(x=="decrease") {sample(c("decrease","decrease","decline","fall","reduction"),1)} else
            if(x=="decreased") {sample(c("lowered","lowered","declined","declined","fell","dropped"),1)} else
              if(x=="higher") {sample(c("higher","higher","greater","greater","an increase","more"),1)} else
                if(x=="lower") {sample(c("lower","lower","reduced","reduced","less"),1)} else
                  if(x=="mostly") {sample(c("mostly","generally","broadly"),1)} else
                    if(x=="always") {sample(c("always","always","consistently","constantly","repeatedly","throughout"),1)}
}

direction<-function(x){
  if(all(diff(x)>0)) {return(paste(sample(c('increasing','increasing','rising','upwards'),1), Word("always"), sep=" "))} else
    if(all(diff(x)<0)) {return(paste(sample(c('decreasing','decreasing','falling','downwards'),1), Word("always"), sep=" "))} else
      if(sum(diff(x))>0) {return(paste(Word("mostly"),sample(c('increasing','increasing','rising','upwards'),1), sep=" "))} else
        if(sum(diff(x))<0) {return(paste(Word("mostly"),sample(c('decreasing','decreasing','falling','downwards'),1), sep=" "))} else
          return(sample(c("mixed","mixed","variable","variable","volatile"),1))
}
