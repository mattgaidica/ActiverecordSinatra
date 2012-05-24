#app.rb
require 'sinatra'
require 'sinatra/activerecord'
require 'json'

set :database, 'postgres://matt@localhost/activerecord_sinatra'

class Course < ActiveRecord::Base
  belongs_to :teacher
end

class Teacher < ActiveRecord::Base
  has_many :courses
end

get '/' do
  "Hello World!"
end

get '/courses' do
  Course.all.to_json
end

get '/course/:id' do
  Course.find(:first, params[:id]).to_json
end

get '/teachers' do
  Teacher.all.to_json
end

get '/teacher/:id' do
  Teacher.find(:first, params[:id]).to_json
end

#show which courses the teacher teaches
get '/teacher/:id/courses' do
  Teacher.find(params[:id]).courses.to_json
end

get '/make' do
  teacher1 = Teacher.create(:name => "Mrs. Crabtree")
  teacher2 = Teacher.create(:name => "Alberto Yeinstein")
  Course.create(:title => "Algebra 2", :teacher_id => teacher1.id)
  Course.create(:title => "Basic Geometry", :teacher_id => teacher1.id)
  Course.create(:title => "Applied Physics", :teacher_id => teacher2.id)
  Course.create(:title => "General Relativity", :teacher_id => teacher2.id)
  Course.create(:title => "Complex Geometrical Spaces", :teacher_id => teacher2.id)
  "Success!"
end