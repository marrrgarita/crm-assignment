class Contact

  # This method should initialize the contact's attributes
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@next_id = 100
  @@contacts = []


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.find { |contact| contact.id == id}
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, label)
    case attribute
    when "first_name"
      @@contacts.find { |contact| contact.first_name == label}
    when "last_name"
      @@contacts.find { |contact| contact.last_name == label}
    when "email"
      @@contacts.find { |contact| contact.email == label}
    when "note"
      @@contacts.find { |contac| contact.email == label}
    else
      puts "no that is not a valid search item found"
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end


  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@next_id
    @@next_id += 1
  end


  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    case attribute
    when "first_name"
      @first_name = new_value
    when "last_name"
      @last_name = new_value
    when "email"
      @email = new_value
    when "note"
      @note = new_value
    end
  end

  def full_name
    first_name + " " + last_name
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
      @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
