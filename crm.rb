require_relative 'contact.rb'

class CRM

  def initialize

  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
  end

  def call_option
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
    print 'Enter First Name:'
    first_name = gets.chomp

    print 'Enter Last Name:'
    last_name = gets.chomp

    print 'Enter Email Address:'
    email = gets.chomp

    print 'Enter a note:'
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)

  end

  def modify_existing_contact
    print 'Enter contact ID to modify:'
    id = gets.to_i

    contact_to_modify = Contact.find(id)

    puts 'Please select the attribute to modify'
    puts '[first_name] to update the first name'
    puts '[last-name] to update the last name'
    puts '[email] to update the e-mail address'
    puts '[note] to update the note'

    attribute_to_modify = gets.chomp

    puts "What would you like to change the #{attribute_to_modify} to?"

    new_value = gets.chomp

    contact_to_modify.update("#{attribute_to_modify}, #{new_value}")

  end

  def delete_contact

    print 'Enter a contact to delete:'

    id = gets.to_i

    contact_to_delete = Contact.find(id)
    contact_to_delete.delete

  end

  def display_all_contacts

    all_contacts = Contact.all
    all_contacts.each do |contact|
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

    Contact.find_by("#{attribute_to_search}", "#{label}")

  end


end
