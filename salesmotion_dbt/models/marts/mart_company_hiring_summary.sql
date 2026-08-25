with jobs as (

    select * from {{ ref('stg_jobs_openings') }}

),

aggregated as (

    select
        company_name,
        company_domain,
        count(distinct job_id) as total_open_positions,

        -- Répartition par niveau de séniorité
        countif(lower(seniority_level) like '%senior%' or lower(seniority_level) like '%lead%') as senior_positions_count,
        countif(lower(seniority_level) like '%entry%' or lower(seniority_level) like '%junior%') as junior_positions_count,

        -- Métriques d'engagement
        sum(coalesce(number_of_applicants, 0)) as total_applicants,
        avg(number_of_applicants) as avg_applicants_per_job,

        -- Suivi temporel
        min(posted_at) as earliest_job_posted_at,
        max(posted_at) as latest_job_posted_at,
        max(ingested_at) as last_data_ingestion_at

    from jobs
    group by 1, 2

)

select * from aggregated
