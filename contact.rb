class Contact
  attr_reader :id #getter/reader
  attr_accessor :first_name, :last_name, :email, :note #getter/setter
  @@contacts = []
  @@id = 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email     = email
    @note      = note
    @id        = @@id
    @@id      += 1
  end

  # def email                            #getter/reader
  #   @email
  # end
  # def email=(email)                     #setter/writer
  #   @email = email
  # end
  # def note                            #getter/reader
  #   @note
  # end
  # def note=(note)                       #setter/writer
  #   @note = note
  # end
  # def first_name                          #getter
  # @first_name
  # end
  # def first_name=(first_name)             #getter
  # @first_name = first_name
  # end
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
   @@contacts                                         # OR @@contacts.each do |x|
  end                                                #puts "#{x.first_name} #{x.last_name}"
                                                  #puts "#{x.email}"
                                                     #puts "#{x.note}"
                                                     #puts "#{x.id}"
  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id.to_i
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute,value)  #option_selected = attribute(first name, last name, name ,email)
   case attribute
   when 1 then self.first_name = value
   when 2 then self.last_name  = value
   when 3 then self.email      = value
   when 4 then self.note       = value
   end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute,value)  # attribute = first name   value = "madhu"
    @@contacts.each do |person|
      return person if value == person.first_name
      return person if value == person.last_name
      return person if value == person.email
      return person if value == person.note
    end
  end


  # This method should delete all of the contacts
  def self.delete_all
    @@contact.clear
  end

  def full_name
       "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
     #@@contact.delete_if { |contact| contact.id == self }
      @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
  Contact.create("Madhu","Mishra","madhu.mishra20@gmail.com", "awesome")
  Contact.create("Arun", "Tiwari", "arun20@gmail.com", "cool")
  Contact.create("Harsh", "Lamba", "harsh.lamba@gmail.com","hello")
  #Contact.all
  contact = Contact.find(2)
  puts contact.update(1,"Madhu")
  puts contact.first_name
  #puts Contact.find_by("first name","Madhu").first_name
