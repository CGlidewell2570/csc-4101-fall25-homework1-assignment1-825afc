class PhoneBook
    def initialize
        @items = []
    end

    def add(name, number, is_listed)
        #Check that name doesn't already exist
        if doesNameExist?(name)
            return false 
        end

        #Check that the number is valid format
        if !isNumberValid?(number)
            return false
        end

        #Check that number is not listed true
        if is_listed && isNumberListed?(number)
            return false
        end

        #Add item to the items list
        @items << {name: name, phone_number: number, listed: is_listed}
        #Phone number has been successfully added
        return true
    end

    def lookup(name)
        person = @items.find {|item| item[:name] == name && item[:listed]}
        return nil if person.nil?
        person[:phone_number]
    end

    def lookupByNum(number)
        person = @items.find {|item| item[:phone_number] == number && item[:listed]}
        return nil if person.nil?
        person[:name]
    end

    def namesByAc(areacode)
        return [] if areacode.nil? || areacode.strip.empty?
        
        @items.select {|item| item[:phone_number].start_with?("#{areacode}-")}
        .collect{ |item| item[:name]}
    end

    # Helper methods I created in order to make the code cleaner

    def doesNameExist?(name)
        @items.any? {|item| item[:name] == name}
    end

    def isNumberValid?(number)
        !!(number =~ /^[1-9]\d{2}-\d{3}-\d{4}$/)
    end

    def isNumberListed?(number)
        @items.any? {|item| item[:phone_number] == number && entry[:listed]}
    end


end
