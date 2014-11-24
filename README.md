GrapeSwaggerExample
===================

To run the example:
bundle install
bundle exec shotgun

To test posts:
curl -d '{"kitty": "SabreToothed", "meow":"ROAR!"}' 'http://localhost:9393/kitty' -H Content-Type:application/json -v (no missing params)
curl -d '{"kitty": "SabreToothed"}' 'http://localhost:9393/kitty' -H Content-Type:application/json -v (missing optional param)
curl -d '{}' 'http://localhost:9393/kitty' -H Content-Type:application/json -v (missing required param)

To test gets, curl or browse to:
http://localhost:9393/kitty?kitty=tabby&meow=mew (no missing params)
http://localhost:9393/kitty?kitty=tabby  (missing optional param)
http://localhost:9393/kitty  (missing required param)
