
----Adding country name, continent on economies_2010 and population_2010

	Alter table economies_2010
	Add country_name Nvarchar(255);

	Update economies_2010
	Set country_name = c.country_name
	from countries as c
	join economies_2010 as e2010
	on c.code = e2010.code;


	Alter table economies_2010
	Add continent Nvarchar(255);

	Update economies_2010
	Set continent = c.continent
	from countries as c
	join economies_2010 as e2010
	on c.code = e2010.code;


	Alter table population_2010
	Add continent Nvarchar(255);

	Update population_2010
	set continent = c.continent
	from countries as c
	join population_2010 as p2010
	on c.code = p2010.country_code;


	Alter table population_2010
	Add country_name Nvarchar(255)

	Update population_2010
	set country_name = c.country_name
	from countries as c
	join population_2010 as p2010
	on c.code = p2010.country_code

--Calculating Average life expectancy for the continents

	Select continent, round(AVG(life_expectancy),2) as AvgLifeExpectancy
	From population_2010
	Where continent In ('Asia', 'North America','Africa','Europe','South America', 'Oceania')
	Group by continent;

--Calculating Average Life Expentancy for Asian Coutries

	Select country_name, AVG(life_expectancy) as AvgLifeExpectancy_AsianCountries_2010
	From dbo.population_2010
	Where continent='Asia'
	group by country_name;

--Calculating Average Gross Saving for the Asian country

	Select country_name, round(avg(gross_savings),2) as Average_GrossSaving_Country_2010
	From dbo.economies_2010
	Where country_name is not null and continent = 'Asia'
	Group by country_name

--Calculating Average Gross Saving for the continents

	Select continent, round(avg(gross_savings),2) as Average_GrossSaving_Conti_2010
	From dbo.economies_2010
	Where continent is not null
	Group by continent
	Order by continent


--Calculating Population for the Asian Countries

	Select country_name, size as Population
	From population_2010
	Where continent = 'Asia'
