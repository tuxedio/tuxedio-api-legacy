module PeopleRepresenter
  include Representable::JSON::Collection

  items extend: PersonRepresenter, class: V1::Person
end
