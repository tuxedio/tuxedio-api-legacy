module ExperienceRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  property :name
  property :location
  property :description
  property :vendor
  property :price

  link :self do
    v1_experience_url self
  end
end
