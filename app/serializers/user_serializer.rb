class UserSerializer < ActiveModel::Serializer
  attributes :uid, :name, :email, :username, :avatar
end