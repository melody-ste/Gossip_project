require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [author, content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    all_gossips = self.all
    all_gossips[id.to_i - 1]  # -1 pour que ce soit aligner avec l'index
  end


  #mise à jour des potins 
  
  def self.update(id, new_author, new_content)
    gossips = self.all
    gossips[id.to_i - 1].author = new_author
    gossips[id.to_i - 1].content = new_content

    CSV.open("./db/gossip.csv", "w") do |csv|
      gossips.each do |gossip|
        csv << [gossip.author, gossip.content]
      end
    end
  end

end