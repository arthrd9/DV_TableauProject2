toys_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "select * from GENDER_TOYS "')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))


#MASCULINE RANK : Partitioned by gender with PSAI_Total descending
PSAIrank_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "select AGE, GENDER, PSAI_TOTAL, rank() 
OVER (PARTITION BY GENDER order by PSAI_TOTAL desc) as MASCULINE_BEHAVIOR_RANK from GENDER_TOYS "')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

#MASCULINE RANK 2: Partitioned by AGE and only in cases where gender is female - ordered by PSAI_total ascending and partitioned by each AGE
PSAIrank2_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "select AGE, GENDER, PSAI_TOTAL, rank() 
OVER (PARTITION BY AGE order by PSAI_TOTAL asc) as MASCULINE_BEHAVIOR_RANK from GENDER_TOYS where GENDER = 2"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

#Need max_value/last_value/diff dataframe

#nth value
PSAInthval_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "SELECT AGE, GENDER, PSAI_Total, nth_value(PSAI_Total, 2)
OVER (PARTITION BY GENDER) as nth_value 
FROM GENDER_TOYS
order by 2,3 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

#cume_dist
PSAIcume_dist_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "select AGE, GENDER, PSAI_Total, cume_dist() 
OVER (PARTITION BY GENDER order by PSAI_Total) as cume_dist
from GENDER_TOYS
order by 2,3 asc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))



