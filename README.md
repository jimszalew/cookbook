# Cookbook
Using the Spoonacular API, which already has some great filtering built in, with some great documentation to go along with it: https://spoonacular.com/food-api/docs. The goal of this app will be to find recipes and save them to a cookbook.

## Interacting with the API

### Base URL
https://lit-bastion-79583.herokuapp.com/

### API Endpoints
- <code>GET /api/v1/searches</code>
-- Returns a list of all stored searches. Optional parameters include <code>crit_asc</code> (alphabetically by search criteria) and <code>updated_desc</code> which will sort them oldest to newest by their updated_at.
- <code>GET /api/v1/searches/:id</code>
-- Returns search with corresponding id
- <code>POST /api/v1/searches</code>
-- Creates a new search object and dishes. Required Parameter <code>search[:criteria]</code>
- <code>DELETE /api/v1/searches/:id</code>
-- Deletes a search with corresponding id and its dishes

## Running it locally
1. Initial setup
    1. clone the repository with git clone
    2. <code>bundle install</code>
2. Database creation and setup
    1. <code>rails db:create</code>
    2. <code>rails db:migrate</code>
    3. <code>rails db:test:prepare</code>
3. Testing
    1. <code>rspec</code> from the project's root directory


### Ruby version
- 2.7.2

### System dependencies
- rails 6.1.4
- bundler 2.2.21
- postgres 13.3

### Source API
**[Spoonacular](https://spoonacular.com/food-api/)**

### Refactor and Upgrade Goals
1. Slim down the create action in the searches controller. For one, most of that logic can be moved to a spoonacular service leaving basically the search.create and render in the controller action. The dish attributes could use another helper that maps to the renamed keys.
2. Clean up the searches_spec, maybe separate the different requests into their own spec files for ease of maintainability.
3. More filtering for searches.
4. Sortable and filterable endpoints for the dishes created by searches.
5. A cookbook feature to save favorite dishes to.
