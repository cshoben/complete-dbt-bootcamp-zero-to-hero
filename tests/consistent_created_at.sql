SELECT reviews.review_date, listings.created_at
FROM {{ ref('fct_reviews') }} AS reviews
LEFT JOIN {{ ref('dim_listings_cleansed') }} AS listings
ON reviews.listing_id = listings.listing_id
WHERE reviews.review_date < listings.created_at

/*
sudo code / brain dump

I want to make sure the 'review date' in fct_reviews is greater than 'created_at' in dim_listings_cleansed.
I will need to join the tables. Maybe listing_id in fct_reviews and listing_id in dim_listings_cleansed. 

Since I do not want a listing if it does not have a corresponding review, I will not do a full join. 

I should not have any reviews that do not match to a listing, so I should be able to do a left join. 
If I have an issue, then this is another thing this test can capture. 
Is that okay or is best practice to make a separate test for that?


*/