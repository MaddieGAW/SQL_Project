# Checking all rows of each csv has been imported 
SELECT COUNT(incident_id)
FROM incidents;
SELECT COUNT(year) 
FROM country_data;
SELECT COUNT(year) 
FROM global_data;

# Breakdown of total killed, total kidnapped, total wounded, total affected by year
SELECT year, SUM(total_killed) AS total_killed, SUM(total_kidnapped) AS total_kidnapped, SUM(total_wounded) AS total_wounded, SUM(total_affected) AS total_affected
FROM incidents
GROUP BY year
ORDER BY year;

# Breakdown of nationals vs internationls by year
SELECT year, SUM(nationals_killed) AS nationals_killed, SUM(nationals_wounded) AS nationals_wounded, SUM(nationals_kidnapped) AS nationals_kidnapped, SUM(total_nationals) AS total_nationals, SUM(internationals_killed) AS internationals_killed, SUM(internationals_wounded) AS internationals_wounded, SUM(internationals_kidnapped) AS internationals_kidnapped, SUM(total_internationals) AS total_internationals, SUM(total_killed) AS total_killed, SUM(total_kidnapped) AS total_kidnapped, SUM(total_wounded) AS total_wounded, SUM(total_affected) AS total_affected
FROM incidents
GROUP BY year
ORDER BY year;

# 10 most dangerous years
SELECT year, 
    SUM(total_killed) AS total_killed, 
    SUM(total_kidnapped) AS total_kidnapped, 
    SUM(total_wounded) AS total_wounded, 
    SUM(total_affected) AS total_affected
FROM incidents
GROUP BY year
ORDER BY total_affected DESC
LIMIT 10;

# 10 most dangerous countries
SELECT country, 
    SUM(total_killed) AS total_killed, 
    SUM(total_kidnapped) AS total_kidnapped, 
    SUM(total_wounded) AS total_wounded, 
    SUM(total_affected) AS total_affected
FROM incidents
GROUP BY country
ORDER BY total_affected DESC
LIMIT 10;

# Is there a time of year that is more dangerous for humanitarian aid workers?
SELECT
    ROUND(AVG(incident_count)) AS avg_incidents_per_month,
    month
FROM (
        SELECT
            COUNT(incident_id) AS incident_count,
            month
        FROM
            incidents
        GROUP BY
            month
     ) AS monthly_counts
GROUP BY
    month
ORDER BY
    avg_incidents_per_month ASC; 
    
# Breakdown by organisation type, per year
SELECT
    year,
    organization_type,
    SUM(affected_count) AS total_people_affected
FROM (
    SELECT
        year,
        'un' AS organization_type,
        un AS affected_count
    FROM
        incidents
    UNION ALL
    SELECT
        year,
        'ingo' AS organization_type,
        ingo AS affected_count
    FROM
        incidents
    UNION ALL
    SELECT
        year,
        'icrc' AS organization_type,
        icrc AS affected_count
    FROM
        incidents
    UNION ALL
    SELECT
        year,
        'nrcs_and_ifrc' AS organization_type,
        nrcs_and_ifrc AS affected_count
    FROM
        incidents
    UNION ALL
    SELECT
        year,
        'nngo' AS organization_type,
        nngo AS affected_count
    FROM
        incidents
    UNION ALL
    SELECT
        year,
        'other' AS organization_type,
        other AS affected_count
    FROM
       incidents
) AS organization_data
GROUP BY
    year, organization_type
ORDER BY
    year, organization_type;
    
# Total affected by organisation type
SELECT
    organization_type,
    SUM(affected_count) AS total_people_affected
FROM (
    SELECT
        'un' AS organization_type,
        un AS affected_count
    FROM
        incidents
    UNION ALL
    SELECT
        'ingo' AS organization_type,
        ingo AS affected_count
    FROM
        incidents
    UNION ALL
    SELECT
        'icrc' AS organization_type,
        icrc AS affected_count
    FROM
        incidents
    UNION ALL
    SELECT
        'nrcs_and_ifrc' AS organization_type,
        nrcs_and_ifrc AS affected_count
    FROM
        incidents
    UNION ALL
    SELECT
        'nngo' AS organization_type,
        nngo AS affected_count
    FROM
        incidents
    UNION ALL
    SELECT
        'other' AS organization_type,
        other AS affected_count
    FROM
        incidents
) AS organization_data
GROUP BY
    organization_type
ORDER BY
    organization_type;

# Breakdown of means of attack per year
SELECT year, means_of_attack, COUNT(*)
FROM incidents
GROUP BY year, means_of_attack
ORDER BY year, means_of_attack;

# Breakdown of means of attack total
SELECT means_of_attack, COUNT(*) as total_incidents
FROM incidents
GROUP BY means_of_attack
ORDER BY total_incidents DESC;

# Breakdown of motive of per year
SELECT year, motive, COUNT(*)
FROM incidents
GROUP BY year, motive
ORDER BY year, motive;

# Breakdown of motive of per year
SELECT motive, COUNT(*) as total_incidents
FROM incidents
GROUP BY motive
ORDER BY total_incidents DESC;

# JOINSS JOINS JOINS # JOINSS JOINS JOINS # JOINSS JOINS JOINS # JOINSS JOINS JOINS # JOINSS JOINS JOINS 
SELECT year, country_iso, country, total_affected, cd.country_fatalities
FROM incidents AS I 
INNER JOIN country_data AS cd
USING (year, country_iso)
GROUP BY year, country;


SELECT I.year, I.country_iso, I.country, SUM(I.total_affected) AS total_affected, cd.country_fatalities
FROM incidents AS I 
INNER JOIN country_data AS cd
ON I.year = cd.year AND I.country_iso = cd.country_iso
GROUP BY I.year, I.country_iso, I.country, cd.country_fatalities;

# 
