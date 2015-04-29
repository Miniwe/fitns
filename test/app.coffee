
# @read https://www.npmjs.com/package/supertest

sut = require '../app/app.coffee'
should = require 'should'

describe 'Writing Node with CoffeeScript', ->
  it 'is easy to get started testing... or is it?', -> true
  it 'can access exported functions in other modules', ->
    sut.greeting('Marcus').should.equal 'Hello Marcus!'


describe 'GET /status', ->
  it 'respond with json', (done) ->
    request(app)
      .get('/status')
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(200, done);
