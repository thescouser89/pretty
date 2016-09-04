# README

This README would normally document whatever steps are necessary to get the application up and running.

Things you may want to cover:

- Ruby version: 5.0.0

- System dependencies: postgresql, sqlite3

- Configuration

- Database creation Right now we are dumping the schema from PostgreSQL and putting it into ETT.

  ```
  rails db:schema:dump
  ```

  Then we push those changes to the database by creating a gigantic migration. This is done by putting the schema.rb inside the `migrate` folder, and renaming it appropriately.

  Note: we are assuming there are no other `migrate` files in the migrate folder, otherwise things might break

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

# TODO

- [ ] Cleanup ETT database before migration to Rails 5
  - [ ] Port the existing models on Rails 2 to Rails 5
  - [ ] Write unit tests for the models to uncover issues
  - [ ] Delimit the rails5 specific changes with a guard on both Rails2 and Rails5 code
  - [ ] Continue until all unit tests pass
- [ ] Migrate schema and add models, keep models stable
- [ ] Work on controllers
- [ ] Rewrite view from scratch using Patternfly
