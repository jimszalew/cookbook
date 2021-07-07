# Cookbook
Using the Spoonacular API, which already has some great filtering built in, with some great documentation to go along with it: https://spoonacular.com/food-api/docs. The goal of this app will be to find recipes and save them to a cookbook.

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
