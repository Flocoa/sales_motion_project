with source as (

    select * from {{ source('raw', 'jobs') }}

),

renamed_and_casted as (

    select
        -- Identifiants
        cast(id as string) as job_id,
        cast(companyId as string) as company_id,
        cast(company_domain as string) as company_domain,

        -- Métadonnées de l'offre
        cast(title as string) as job_title,
        cast(companyName as string) as company_name,
        cast(location as string) as job_location,
        cast(seniorityLevel as string) as seniority_level,
        cast(employmentType as string) as employment_type,
        cast(jobFunction as string) as job_function,
        cast(industries as string) as industry,
        cast(url as string) as job_url,
        cast(status as string) as job_status,

        -- Métriques & Compteurs
        safe_cast(applicants as int64) as number_of_applicants,
        cast(job_number as int64) as job_ingestion_index,

        -- Timestamps
        safe_cast(postedOn as timestamp) as posted_at,
        safe_cast(_ingested_at as timestamp) as ingested_at

    from source

)

select * from renamed_and_casted
