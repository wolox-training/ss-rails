ActiveAdmin.register Book do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :author, :image, :title, :year, :editor, :book_genre, :slug
  #
  # or
  #
  # permit_params do
  #   permitted = [:author, :image, :title, :year, :editor, :book_genre, :slug]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  controller do
    # ... other actions 

    def create
      @comment = Comment.new(params[:comment])

      respond_to do |format|
        if @comment.save
          AdminMailer.comment_created(@comment.id).deliver
          redirect_to @comment
        end
      end
    end
  end
end
