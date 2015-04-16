toys_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "select * from GENDER_TOYS "')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))


#MASCULINE RANK : Partitioned by gender with PSAI_Total descending
PSAIrank_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "select AGE, GENDER, PSAI_TOTAL, rank() 
OVER (PARTITION BY GENDER order by PSAI_TOTAL desc) as MASCULINE_BEHAVIOR_RANK from GENDER_TOYS "')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

#MASCULINE RANK 2: Partitioned by AGE and only in cases where gender is female - ordered by PSAI_total ascending and partitioned by each AGE
PSAIrank2_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "select AGE, GENDER, PSAI_TOTAL, rank() 
OVER (PARTITION BY AGE order by PSAI_TOTAL asc) as MASCULINE_BEHAVIOR_RANK from GENDER_TOYS where GENDER = 2"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

#difference!! NOT RETURNING VALUES!!!!!
PSAIdiff_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "select AGE, GENDER, PSAI_Total, last_value(max_PSAI) 
OVER (PARTITION BY GENDER order by PSAI_Total) as max_PSAI, last_value(max_PSAI)
OVER (PARTITION BY GENDER order by PSAI_Total) - PSAI_Total as PSAI_diff
from
(select AGE, GENDER, PSAI_Total, max(PSAI_Total)
OVER (PARTITION by GENDER) as max_PSAI
from GENDER_TOYS)"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

#MAX_PSAI NTH VALUE: Partitioned by AGE and GENDER, and gives the max PSAI_Total score 
PSAInthval_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "SELECT AGE, GENDER, PSAI_Total, nth_value(PSAI_Total, 1)
OVER (PARTITION BY AGE, GENDER) as MAX_PSAI
FROM GENDER_TOYS"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

#cume_dist
PSAIcume_dist_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query= "select AGE, GENDER, PSAI_Total, cume_dist() 
OVER (PARTITION BY AGE, GENDER order by PSAI_Total) as cume_dist
from GENDER_TOYS"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_map4542', PASS='orcl_map4542', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))



