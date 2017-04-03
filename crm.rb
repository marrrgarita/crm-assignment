require_relative 'contact.rb'

class CRM

attr_reader :name

  def initialize(name)
    @name = name
    self.main_menu
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts ' '
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)

    puts "#{first_name} #{last_name} has been successfully added!"

  end

  def modify_existing_contact
    print 'Enter contact ID to modify:'
    id = gets.to_i

    contact_to_modify = Contact.find(id)

    puts "You are about to modify #{contact_to_modify.full_name}"

    puts 'Please select the attribute to modify'
    puts '[first_name] to update the first name'
    puts '[last_name] to update the last name'
    puts '[email] to update the e-mail address'
    puts '[note] to update the note'


    attribute_to_modify = gets.chomp

    puts "What would you like to change the #{attribute_to_modify} to?"

    new_value = gets.chomp

    contact_to_modify.update("#{attribute_to_modify}", "#{new_value}")

    puts "You have successfully updated #{contact_to_modify.full_name}!"

  end

  def delete_contact

    print 'Enter a contact id to delete:'
    id = gets.to_i
    contact_to_delete = Contact.find(id)

    puts "You are about to delete #{contact_to_delete.full_name}"
    puts "Are you sure? [y] or [n]"

    answer = gets.chomp.downcase

    if answer == "y"
      contact_to_delete.delete
      puts "#{contact_to_delete.full_name} has been deleted"
    elsif answer == "n"
      puts "Returning to main menu..."
      self.main_menu
    end
  end

  def display_all_contacts

    all_contacts = Contact.all
    all_contacts.each do |contact|
      puts "****CONTACT #{contact.id}****"
      puts "Name: #{contact.full_name}"
      puts "Email: #{contact.email}"
      puts "Note: #{contact.note}"
    end

  end

  def search_by_attribute
    puts 'Please select the attribute to search by'
    puts '[first_name] to search by the first name'
    puts '[last-name] to search by the last name'
    puts '[email] to search by the e-mail address'
    puts '[note] to search by the note'

    attribute_to_search = gets.chomp

    puts "What is the #{attribute_to_search} you are searching for?"

    label = gets.chomp

    result = Contact.find_by("#{attribute_to_search}", "#{label}")

    puts "****CONTACT #{result.id}****"
    puts "Name: #{result.full_name}"
    puts "Email: #{result.email}"
    puts "Note: #{result.note}"

  end
end
