# URL Shortener 101

To run:

* assume a local ruby installation is functional
* bundle install
* bundle exec rails server

Live site:

https://url-shortenifier.herokuapp.com/

API path:

https://url-shortenifier.herokuapp.com/api/redirects

# Notes

* I have used a couple of different patterns in this project in the hope of provoking conversation. I am not much of a fan of using exceptions for control flow, so I've implemented CreateRedirectForm in more of a "service" pattern using monads for explicit error handling. I've had good experience with this pattern and think it improves modularity and reusability. Elsewhere, however, I have created objects directly in the controller

* Also, to be controversial, I've skipped validations in the model in favour of performing this in the service. This is borne of past negative experience with conditional validations in models depending on the context - I've had good experience moving validations to better reflect the context in which they are invoked. However, again, this might be controversial to some...

* I've tried out a new CSS framework (tailwind) I've heard was good in this. The jury is still out on that, not sure I like it but need more experience with it

* I've also tried out a new jsonapi library in this project. I am probably using it suboptimally. My main goal was to have a "discoverable" API with clickable links in an appropriate browser.

* While JSONAPI is very discoverable, writing tests for it efficiently requires a lot of helper code. I've skipped tests in the API for this reason (can add if desired)

* I considered using GraphQL, my current favourite API format, but rejected it as posisbly too inconvenient to browse.

* I've adopted a very simplistic methodology for cloaking object IDs associated with redirects - this could also be easily reverse engineered. A better approach would be less obvious in its implementation. I didn't want to reach straight for UUIDs though since the goal was explicitly shortening

* URL parsing is extremely dodgy and will probably break horribly with invalid URLs. I should probably have used a different library than the very basic URI in stdlib. This would be an obvious easy win


While I believe I've ticked the boxes for the coding test, there are many improvements to be made before I would consider this production quality.

- URL parsing could use a lot of improvement. Perhaps implement this regex-based approach: https://gist.github.com/dperini/729294
- the tests, while somewhat adequate, could be improved and better organised
- user authentication, naturally
- I am not a fan of presentation logic in models, eg ```Redirect#short_url```. I like to move this kind of thing to presenters and would do so if it became more complex
- pagination in the API section
- filter headers collected in visits - current saving *all* of them
- possibly add forwarded-for


