
-- Select Data that we are going to be using and take a look

 SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidProjectPortfolio..CovidDeaths
ORDER BY 1,2


--Looking for death percentage: total_deaths/total_cases
--Shows liklihood of dying if you are infected in your country	
	 
SELECT location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100, 2) as DeathPercentage
FROM CovidProjectPortfolio..CovidDeaths
WHERE location like 'Spain'
ORDER BY 1,2


--Looking at the Total Cases vs Population
--Shows what percentage of population got Covid

Select location, date, total_cases, population, ROUND((total_cases/population)*100, 3) AS InfectedRatio
From CovidProjectPortfolio..CovidDeaths
WHERE location like'Spain'
ORDER BY 1,2


--Looking at Countries with Highest Infection Rate compared to population 

Select location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS InfectedRatio
From CovidProjectPortfolio..CovidDeaths
GROUP BY location, population
ORDER BY InfectedRatio DESC


--Showing Countires with Highest Death Count 

Select location, MAX(total_deaths) AS HighestDeathCount--, MAX((total_deaths/population))*100 AS DeathRatio
From CovidProjectPortfolio..CovidDeaths
WHERE continent is not NULL
GROUP BY location
ORDER BY HighestDeathCount DESC


--Showing Countires with Highest Death Count per population

Select location, MAX(total_deaths_per_million) AS HighestDeathCountPerMillion
From CovidProjectPortfolio..CovidDeaths
WHERE continent is not NULL 
GROUP BY location
ORDER BY HighestDeathCountPerMillion DESC

	 
--Showing Continents with Highest Death Count 

Select continent, sum(new_deaths) AS HighestDeathCount
From CovidProjectPortfolio..CovidDeaths
WHERE continent is not NULL
GROUP BY continent
ORDER BY HighestDeathCount DESC
	 
--This actually shows similar - total deaths by continent and other groups such as level of income

Select location, MAX(total_deaths) AS HighestDeathCount
From CovidProjectPortfolio..CovidDeaths
WHERE continent is NULL
GROUP BY location
ORDER BY HighestDeathCount DESC

	 
--Showing continent with the highest death count per population

Select location, MAX(total_deaths) AS HighestDeathCount, max(population) as Population, ROUND((max(total_deaths)/max(population)*100),3) AS DeathRate
From CovidProjectPortfolio..CovidDeaths
WHERE continent is NULL
GROUP BY location
ORDER BY DeathRate DESC

	 
-- Showing continent with the highest death count per population using data from countries only 
	 
SELECT 
	HighestDeathCount.continent, 
	HighestDeathCount.DeathCount, 
	cont_population.Population, 
	(HighestDeathCount.DeathCount/cont_population.Population)*100 AS HighestDeathRate
FROM (
	Select 
		continent, 
		sum(new_deaths) AS DeathCount 
	From CovidProjectPortfolio..CovidDeaths
	WHERE continent is not NULL
	GROUP BY continent) HighestDeathCount 
	
	LEFT JOIN (
	SELECT continent, sum(population) AS Population FROM (
		SELECT 
		continent, 
		location, 
		max(population) AS population  
		FROM CovidProjectPortfolio..CovidDeaths 
		WHERE continent is not NULL 
		GROUP BY continent, location
		) populations
GROUP BY continent) cont_population ON HighestDeathCount.continent = cont_population.continent
ORDER BY HighestDeathRate DESC


-- GLOBAL NUMBERS
	 
-- Deaths to Cases ratio by date
	 
SELECT date, SUM(new_cases) as Cases, SUM(new_deaths) AS Deaths, ROUND(SUM(new_deaths)/SUM(new_cases)*100, 2) as DeathPercentage
FROM CovidProjectPortfolio..CovidDeaths
WHERE continent is not NULL and date BETWEEN '2020-01-22' AND '2023-11-22'
GROUP BY date
ORDER BY 1,2

	 
--Deaths to cases ratio for the World sinse the beginning of Covid-10 pandemia

	 SELECT SUM(new_cases) as Cases, SUM(new_deaths) AS Deaths, ROUND(SUM(new_deaths)/SUM(new_cases)*100, 2) as DeathPercentage
FROM CovidProjectPortfolio..CovidDeaths
WHERE continent is not NULL and date BETWEEN '2020-01-22' AND '2023-11-22'
ORDER BY 1,2


--Looking at Total Population vs Vaccination

-- USE CTE 
WITH PopvsVac (continent, location, date,population, new_vaccinations, RollingPeopleVaccinated)
as 
(
SELECT dea.continent as continent, dea.location as location, dea.date as date, dea.population as population, vac.new_vaccinations, 
	SUM(vac.new_vaccinations) OVER (Partition by CONVERT(varchar, dea.location) ORDER BY CONVERT(varchar, dea.location), dea.date) as RollingPeopleVaccinated
FROM CovidProjectPortfolio..CovidDeaths dea JOIN CovidProjectPortfolio..CovidVaccinations vac
	ON dea.location=vac.location AND dea.date = vac.date
WHERE dea.continent is not NULL
) 
SELECT continent, location, population, MAX(RollingPeopleVaccinated) as PeopleVaccinated, ROUND(MAX(RollingPeopleVaccinated)/population*100, 2) AS VacsToPop
FROM PopvsVac
GROUP BY continent, location, population



-- USE TEMP TABLE
DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric, 
vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated

SELECT dea.continent as continent, dea.location as location, dea.date as date, dea.population as population, vac.new_vaccinations, 
	SUM(vac.new_vaccinations) OVER (Partition by CONVERT(varchar, dea.location) ORDER BY CONVERT(varchar, dea.location), dea.date) as RollingPeopleVaccinated
FROM CovidProjectPortfolio..CovidDeaths dea JOIN CovidProjectPortfolio..CovidVaccinations vac
	ON dea.location=vac.location AND dea.date = vac.date
WHERE dea.continent is not NULL

SELECT *, (RollingPeopleVaccinated/Population)*100 as VacsToPop
FROM #PercentPopulationVaccinated

	 
--Creating View to store Data for later visualization

Create View PercentPopulationVaccinated as
SELECT dea.continent as continent, dea.location as location, dea.date as date, dea.population as population, vac.new_vaccinations, 
	SUM(vac.new_vaccinations) OVER (Partition by CONVERT(varchar, dea.location) ORDER BY CONVERT(varchar, dea.location), dea.date) as RollingPeopleVaccinated
FROM CovidProjectPortfolio..CovidDeaths dea JOIN CovidProjectPortfolio..CovidVaccinations vac
	ON dea.location=vac.location AND dea.date = vac.date
WHERE dea.continent is not NULL
