module ExperiencesRepresenter
  include Representable::JSON::Collection

  items extend: ExperienceRepresenter, class: V1::Experience
end
