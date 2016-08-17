
require_relative 'contact'

class CRM

  def initialize
    # puts "Okay, this CRM has the name " + name
    main_menu
  end

  def main_menu
    while true #repeat indefinitely
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
    puts 'Enter a number: '
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

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)

  end

  def modify_existing_contact
    print "please enter your id:"
    id = gets.chomp
    print "Please choose an option you would like to update: First name, Last name, Email, Note :-"
    attribute = gets.chomp.to_i#option_selected
    print "What would you like to replace it with:"
    value= gets.chomp   #replace_with
     found_contact = Contact.find(id)
     found_contact.update(attribute,value)
  end

  def delete_contact
    display_all_contacts
    print "Please enter the ID of the contact you would like to delete"
    id = gets.to_i
    contact_delete = Contact.find(id)
    contact_delete.delete
  end

  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts(all_contacts) #all_contacts = array
     all_contacts.each do |contact|
       puts "ID: #{contact.id}"
       puts "Name: #{contact.first_name} #{contact.last_name}"
       puts "Email: #{contact.email}"
       puts "Note: #{contact.note}"
     end
    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
  end

  def display_all_contacts
      all_contacts = Contact.all
      display_contacts(all_contacts)

    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  def search_by_attribute
    puts "Select an attribute you would like to search for:
    First name: Last name: Email: Note:"
    selection = gets.chomp

    puts "Please enter your search keyword:"
    keyword = gets.chomp

    searched = []
    searched << Contact.find_by(selection, keyword)
    puts searched
    display_contacts(searched)

        # HINT: Make use of the display_contacts method to keep your code DRY
  end

  # Add other methods here, if you need them.

end

CRM.new
