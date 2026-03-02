create schema healthcare;
use healthcare;

##Calculate the total number of patient encounters in the healthcare dataset.
select * from diabetic_data;
select count(encounter_id) from diabetic_data;

##Identify the top 10 most frequent diagnoses in the dataset.
select number_diagnoses, count(*) as freq from diabetic_data group by number_diagnoses order by freq DESC limit 10;

#Calculate the average length of hospital stay for each admission type.
select distinct(admission_type_id), round(avg(time_in_hospital),2) from diabetic_data group by admission_type_id order by admission_type_id
DESC;

#Determine the number of readmitted patients and the percentage of total encounters that they represent.
select count(encounter_id) as total_encounters , sum(case when readmitted <>'NO' then 1 else 0 end) as readmitted_count,
round(sum(case when readmitted <>'NO' then 1 else 0 end)* 100.0/count(encounter_id),2) as readmitted_percentage from diabetic_data;

#Identify the age distribution of patients.
select distinct(age), count(encounter_id) as total_patients_encounters from diabetic_data group by age;

#Identify the most common procedures performed during patient encounters.
select num_procedures, count(*) as most_common_procedure from diabetic_data group by num_procedures order by most_common_procedure DESC;

#Calculate the average number of medications prescribed for patients in each age group.
select distinct(age), round(avg(num_medications),2) as avg_no_of_medication from diabetic_data group by age;

#Identify the distribution of readmission rates across different payer codes.
select payer_code, count(*) as total_encounters, sum(case when readmitted <> 'NO' then 1 else 0 end) as readmitted_count,
round(sum(case when readmitted <> 'NO' then 1 else 0 end)*100.0/count(*),2) as readmitted_percentage from diabetic_data
where payer_code is not null and payer_code <> '?' group by payer_code order by readmitted_percentage DESC;




