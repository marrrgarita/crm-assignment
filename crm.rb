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

  end

  def display_all_contacts

  end

  def search_by_attribute

  end


end
