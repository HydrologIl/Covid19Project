-- truncate the table first
--Importing and preparing data

-- The data I import is in .csv format. There are a lot of Null values. SQL server cannot read Null values from .csv file as values. 
-- SQL Server read Null values as strings 'Null'. So if I try to convert a column with values that shoud be float values, 
-- SQL Server will not convert them from text to float data types, because of strings 'Null'. So I need to replace 'Null' strings
-- with Null values first. 

-- REPLACE 'Null' strings with Null values for CovidDeaths table. First three columns will be left as varchar, the forth - as date.

UPDATE CovidProjectPortfolio..CovidDeaths
SET population = CASE WHEN population = 'NULL' THEN NULL ELSE population END,
	total_cases = CASE WHEN total_cases = 'NULL' THEN NULL ELSE total_cases END,
	new_cases = CASE WHEN new_cases = 'NULL' THEN NULL ELSE new_cases END,
	new_cases_smoothed = CASE WHEN new_cases_smoothed = 'NULL' THEN NULL ELSE new_cases_smoothed END,
	new_deaths = CASE WHEN new_deaths = 'NULL' THEN NULL ELSE new_deaths END,
	new_deaths_smoothed = CASE WHEN new_deaths_smoothed = 'NULL' THEN NULL ELSE new_deaths_smoothed END,
	total_cases_per_million = CASE WHEN total_cases_per_million = 'NULL' THEN NULL ELSE total_cases_per_million END,
	new_cases_per_million = CASE WHEN new_cases_per_million = 'NULL' THEN NULL ELSE new_cases_per_million END,
	new_cases_smoothed_per_million = CASE WHEN new_cases_smoothed_per_million = 'NULL' THEN NULL ELSE new_cases_smoothed_per_million END,
	total_deaths = CASE WHEN total_deaths = 'NULL' THEN NULL ELSE total_deaths END,
  total_deaths_per_million = CASE WHEN total_deaths_per_million = 'NULL' THEN NULL ELSE total_deaths_per_million END,
	new_deaths_per_million = CASE WHEN new_deaths_per_million = 'NULL' THEN NULL ELSE new_deaths_per_million END,
	new_deaths_smoothed_per_million = CASE WHEN new_deaths_smoothed_per_million = 'NULL' THEN NULL ELSE new_deaths_smoothed_per_million END,
	reproduction_rate = CASE WHEN reproduction_rate = 'NULL' THEN NULL ELSE reproduction_rate END,
	icu_patients = CASE WHEN icu_patients = 'NULL' THEN NULL ELSE icu_patients END,
	icu_patients_per_million = CASE WHEN icu_patients_per_million = 'NULL' THEN NULL ELSE icu_patients_per_million END,
  hosp_patients = CASE WHEN hosp_patients = 'NULL' THEN NULL ELSE hosp_patients END,
	hosp_patients_per_million = CASE WHEN hosp_patients_per_million = 'NULL' THEN NULL ELSE hosp_patients_per_million END,
	weekly_icu_admissions = CASE WHEN weekly_icu_admissions = 'NULL' THEN NULL ELSE weekly_icu_admissions END,
	weekly_icu_admissions_per_million = CASE WHEN weekly_icu_admissions_per_million = 'NULL' THEN NULL ELSE weekly_icu_admissions_per_million END,
	weekly_hosp_admissions = CASE WHEN weekly_hosp_admissions = 'NULL' THEN NULL ELSE weekly_hosp_admissions END,
	weekly_hosp_admissions_per_million = CASE WHEN weekly_hosp_admissions_per_million = 'NULL' THEN NULL ELSE weekly_hosp_admissions_per_million END

--After replacing 'NULL' string with NULL values, data type can be changed to float for all these columns.

ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN population FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN total_deaths FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN total_cases FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN new_cases FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN new_cases_smoothed FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN new_deaths FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN new_deaths_smoothed FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN total_cases_per_million FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN new_cases_per_million FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN new_cases_smoothed_per_million FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN total_deaths_per_million FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN new_deaths_per_million FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN new_deaths_smoothed_per_million FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN reproduction_rate FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN icu_patients FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN icu_patients_per_million FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN hosp_patients FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN hosp_patients_per_million FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN weekly_icu_admissions FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN weekly_icu_admissions_per_million FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN weekly_hosp_admissions FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidDeaths
ALTER COLUMN weekly_hosp_admissions_per_million FLOAT;

-- Than the same should be done for CovidVaccinations table, because it was also imported as .csv file with the same problems

UPDATE CovidProjectPortfolio..CovidVaccinations
SET total_tests = CASE WHEN total_tests = 'NULL' THEN NULL ELSE total_tests END,
	new_tests = CASE WHEN new_tests = 'NULL' THEN NULL ELSE new_tests END,
	total_tests_per_thousand = CASE WHEN total_tests_per_thousand = 'NULL' THEN NULL ELSE total_tests_per_thousand END,
	new_tests_per_thousand = CASE WHEN new_tests_per_thousand = 'NULL' THEN NULL ELSE new_tests_per_thousand END,
	new_tests_smoothed = CASE WHEN new_tests_smoothed = 'NULL' THEN NULL ELSE new_tests_smoothed END,
	new_tests_smoothed_per_thousand = CASE WHEN new_tests_smoothed_per_thousand = 'NULL' THEN NULL ELSE new_tests_smoothed_per_thousand END,
	positive_rate = CASE WHEN positive_rate = 'NULL' THEN NULL ELSE positive_rate END,
	tests_per_case = CASE WHEN tests_per_case = 'NULL' THEN NULL ELSE tests_per_case END,
	total_vaccinations = CASE WHEN total_vaccinations = 'NULL' THEN NULL ELSE total_vaccinations END,
	people_vaccinated = CASE WHEN people_vaccinated = 'NULL' THEN NULL ELSE people_vaccinated END,
	people_fully_vaccinated = CASE WHEN people_fully_vaccinated = 'NULL' THEN NULL ELSE people_fully_vaccinated END,
	total_boosters = CASE WHEN total_boosters = 'NULL' THEN NULL ELSE total_boosters END,
	new_vaccinations = CASE WHEN new_vaccinations = 'NULL' THEN NULL ELSE new_vaccinations END,
	new_vaccinations_smoothed = CASE WHEN new_vaccinations_smoothed = 'NULL' THEN NULL ELSE new_vaccinations_smoothed END,
	total_vaccinations_per_hundred = CASE WHEN total_vaccinations_per_hundred = 'NULL' THEN NULL ELSE total_vaccinations_per_hundred END,
	people_vaccinated_per_hundred = CASE WHEN people_vaccinated_per_hundred = 'NULL' THEN NULL ELSE people_vaccinated_per_hundred END,
	people_fully_vaccinated_per_hundred = CASE WHEN people_fully_vaccinated_per_hundred = 'NULL' THEN NULL ELSE people_fully_vaccinated_per_hundred END,
	total_boosters_per_hundred = CASE WHEN total_boosters_per_hundred = 'NULL' THEN NULL ELSE total_boosters_per_hundred END,
	new_vaccinations_smoothed_per_million = CASE WHEN new_vaccinations_smoothed_per_million = 'NULL' THEN NULL ELSE new_vaccinations_smoothed_per_million END,
	new_people_vaccinated_smoothed = CASE WHEN new_people_vaccinated_smoothed = 'NULL' THEN NULL ELSE new_people_vaccinated_smoothed END,
	new_people_vaccinated_smoothed_per_hundred = CASE WHEN new_people_vaccinated_smoothed_per_hundred = 'NULL' THEN NULL ELSE new_people_vaccinated_smoothed_per_hundred END,
	stringency_index = CASE WHEN stringency_index = 'NULL' THEN NULL ELSE stringency_index END,
	population_density = CASE WHEN population_density = 'NULL' THEN NULL ELSE population_density END,
	median_age = CASE WHEN median_age = 'NULL' THEN NULL ELSE median_age END,
	aged_65_older = CASE WHEN aged_65_older = 'NULL' THEN NULL ELSE aged_65_older END,
	aged_70_older = CASE WHEN aged_70_older = 'NULL' THEN NULL ELSE aged_70_older END,
	gdp_per_capita = CASE WHEN gdp_per_capita = 'NULL' THEN NULL ELSE gdp_per_capita END,
	extreme_poverty = CASE WHEN extreme_poverty = 'NULL' THEN NULL ELSE extreme_poverty END,
	cardiovasc_death_rate = CASE WHEN cardiovasc_death_rate = 'NULL' THEN NULL ELSE cardiovasc_death_rate END,
	diabetes_prevalence = CASE WHEN diabetes_prevalence = 'NULL' THEN NULL ELSE diabetes_prevalence END,
	female_smokers = CASE WHEN female_smokers = 'NULL' THEN NULL ELSE female_smokers END,
	male_smokers = CASE WHEN male_smokers = 'NULL' THEN NULL ELSE male_smokers END,
	handwashing_facilities = CASE WHEN handwashing_facilities = 'NULL' THEN NULL ELSE handwashing_facilities END,
	hospital_beds_per_thousand = CASE WHEN hospital_beds_per_thousand = 'NULL' THEN NULL ELSE hospital_beds_per_thousand END,
	life_expectancy = CASE WHEN life_expectancy = 'NULL' THEN NULL ELSE life_expectancy END,
	human_development_index = CASE WHEN human_development_index = 'NULL' THEN NULL ELSE human_development_index END,
	excess_mortality_cumulative_absolute = CASE WHEN excess_mortality_cumulative_absolute = 'NULL' THEN NULL ELSE excess_mortality_cumulative_absolute END,
	excess_mortality_cumulative = CASE WHEN excess_mortality_cumulative = 'NULL' THEN NULL ELSE excess_mortality_cumulative END,
	excess_mortality = CASE WHEN excess_mortality = 'NULL' THEN NULL ELSE excess_mortality END,
	excess_mortality_cumulative_per_million = CASE WHEN excess_mortality_cumulative_per_million = 'NULL' THEN NULL ELSE excess_mortality_cumulative_per_million END


--After replacing 'NULL' string with NULL values, data type can be changed to float for all these columns:

ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN total_tests FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN new_tests FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN total_tests_per_thousand FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN new_tests_per_thousand FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN new_tests_smoothed FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN new_tests_smoothed_per_thousand FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN positive_rate FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN tests_per_case FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN total_vaccinations FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN people_vaccinated FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN people_fully_vaccinated FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN total_boosters FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN new_vaccinations FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN new_vaccinations_smoothed FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN total_vaccinations_per_hundred FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN people_vaccinated_per_hundred FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN people_fully_vaccinated_per_hundred FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN total_boosters_per_hundred FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN new_vaccinations_smoothed_per_million FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN new_people_vaccinated_smoothed FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN new_people_vaccinated_smoothed_per_hundred FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN stringency_index FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN population_density FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN median_age FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN aged_65_older FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN aged_70_older FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN gdp_per_capita FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN extreme_poverty FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN cardiovasc_death_rate FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN diabetes_prevalence FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN female_smokers FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN male_smokers FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN handwashing_facilities FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN hospital_beds_per_thousand FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN life_expectancy FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN human_development_index FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN excess_mortality_cumulative_absolute FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN excess_mortality_cumulative FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN excess_mortality FLOAT;
ALTER TABLE CovidProjectPortfolio..CovidVaccinations
ALTER COLUMN excess_mortality_cumulative_per_million FLOAT;


