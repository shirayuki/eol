class FeedsController < ApplicationController
  def all
    feed = Atom::Feed.new do |f|
      f.title = "Example Feed"
    end
    render :text => feed.to_xml
  end

  def images
    feed = Atom::Feed.new do |f|
      f.updated = Time.now
#      f.authors << Atom::Person.new(:name => 'John Doe')
#      f.id = "urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af6"
      if((taxon_concept_id = params[:page]).nil?)
        f.links << Atom::Link.new(:href => root_url)
        f.title = 'Latest Images'
        images = DataObject.feed_images
      else
        begin
          taxon_concept = TaxonConcept.find(taxon_concept_id)
        rescue
          render_404
          return false
        end
        f.links << Atom::Link.new(:href => url_for(:controller => :taxa, :action => :show, :id => taxon_concept.id))
        f.title = "Latest Images for #{taxon_concept.names[0].string}" #TODO: select more appropriate name?
        images = DataObject.feed_images(taxon_concept.id)
      end
      
      images.each do |image|
        f.entries << image_entry(image)
      end
    end
    render :text => feed.to_xml
  end

  def text
    feed = Atom::Feed.new do |f|
      f.updated = Time.now
#      f.authors << Atom::Person.new(:name => 'John Doe')
#      f.id = "urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af6"
      if((taxon_concept_id = params[:page]).nil?)
        f.links << Atom::Link.new(:href => root_url)
        f.title = 'Latest Text'
        text_entries = DataObject.feed_text
      else
        begin
          taxon_concept = TaxonConcept.find(taxon_concept_id)
        rescue
          render_404
          return false
        end
        f.links << Atom::Link.new(:href => url_for(:controller => :taxa, :action => :show, :id => taxon_concept.id))
        f.title = "Latest Text for #{taxon_concept.names[0].string}" #TODO: select more appropriate name?
        text_entries = DataObject.feed_text(taxon_concept.id)
      end

      text_entries.each do |text|
        f.entries << text_entry(text)
      end
    end
    render :text => feed.to_xml
  end

  def comments
    feed = Atom::Feed.new do |f|
      f.updated = Time.now
#      f.authors << Atom::Person.new(:name => 'John Doe')
#      f.id = "urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af6"

      if((taxon_concept_id = params[:page]).nil?)
        f.links << Atom::Link.new(:href => root_url)
        f.title = 'Latest Comments'
        comments = Comment.feed
      else
        begin
          taxon_concept = TaxonConcept.find(taxon_concept_id)
        rescue
          render_404
          return false
        end
        f.title = "Latest Comments for #{taxon_concept.names[0].string}"
        f.links << Atom::Link.new(:href => url_for(:controller => :taxa, :action => :show, :id => taxon_concept.id))

        comments = Comment.feed(taxon_concept.id)
      end

      comments.each do |comment|
        f.entries << comment_entry(comment)
      end
    end
    render :text => feed.to_xml
  end

  protected
  def create_entry
    
  end

  def image_entry(image)
    Atom::Entry.new do |e|
      tc = image.taxon_concepts[0] #TODO: select lowest species in the hierarchy
      e.title = "New image for #{tc.names[0].string}" #TODO: select most "fitting" name?
      e.links << Atom::Link.new(:href => url_for(:controller => :taxa, :action => :show, :id => tc.id, :image_id => image.id))
#      e.id = "urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a"
      e.updated = image.created_at
      e.content = Atom::Content::Html.new("<a href='#{url_for(:controller => :taxa, :action => :show, :id => tc.id, :image_id => image.id)}'><img src='#{image.smart_image}'/></a>")
#      e.summary = ""
    end
  end

  def text_entry(text)
    Atom::Entry.new do |e|
      tc = text.taxon_concepts[0] #TODO: select the lowest species in the hierarchy
      e.title = "New Text for #{tc.names[0].string}" #TODO: select most "fitting" name?
      e.links << Atom::Link.new(:href => url_for(:controller => :taxa, :action => :show, :id => tc.id, :text_id => text.id))
#      e.id = "urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a"
      e.updated = text.created_at
      e.content = Atom::Content::Html.new("<b>#{text.object_title}</b><br/>#{text.description}")
#      e.summary = "<img src='#{image.smart_image}'/><br/>Image for #{tc.names[0].string}"
    end
  end

  def comment_entry(comment)
    Atom::Entry.new do |e|
      if comment.parent_type == 'TaxonConcept'
        tc = TaxonConcept.find(comment.parent.id)
        e.title = "New comment for #{tc.names[0].string}" #TODO: select the lowest species in the hierarchy, select most "fitting" name?
        e.links << Atom::Link.new(:href => url_for(:controller => :taxa, :action => :show, :id => tc.id, :comment_id => comment.id))
      elsif comment.parent_type == 'DataObject'
        tc = TaxonConcept.find(comment.parent.taxon_concepts[0].id)
        if comment.parent.data_type_id == DataType.image_type_ids[0]
          e.title = "New comment on image for #{tc.names[0].string}" #TODO: select the lowest species in the hierarchy, select most "fitting" name?
          e.links << Atom::Link.new(:href => url_for(:controller => :taxa, :action => :show, :id => tc.id, :image_comment_id => comment.id))
        elsif comment.parent.data_type_id == DataType.text_type_ids[0]
          e.title = "New comment on text for #{tc.names[0].string}" #TODO: select the lowest species in the hierarchy, select most "fitting" name?
          e.links << Atom::Link.new(:href => url_for(:controller => :taxa, :action => :show, :id => tc.id, :text_comment_id => comment.id))
        else
          raise "Unknown comment data object type #{comment.parent.data_type}"
        end
      else
        raise "Unknown comment parent type #{comment.parent_type}"
      end
      e.content = Atom::Content::Html.new(comment.body)
      e.updated = comment.created_at
    end
  end
end