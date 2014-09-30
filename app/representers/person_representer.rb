module PersonRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  self.representation_wrap = :person

  property :name
  property :location
  property :bio
  property :gender
  property :hometown
  property :date_of_birth
  property :user, extend: UserRepresenter, class: V1::User

  link :self do
    v1_person_url self
  end
end
