class DocsController < ApplicationController
    before_action :find_doc, only: [:show, :edit, :update, :destroy]

    def index
        @docs = Doc.all.order("created_at DESC")
    end

    def show

    end

    def new
        @doc = Doc.new
    end

    def create
        # create a new instance of a Doc using params;
            # title and content in this case
        # params = Parameters Method
        # ApplicationController -> ActionController:: -> Parameters Method
        # params refers to paramerters being passed to the controller via:
            # GET and POST requests
                # GET request is passed to the controller via URL from the user's browser
                    #(ie) .find(params)
                # POST request is passed via the form, usually
                    #(ie) .new(params)
        @doc = Doc.new(doc_params)
        # redirect vs. render
        # redirect is a HTTP refresh and all content on the page is lost
        # render does not refresh the page
        if @doc.save
            redirect_to @doc
        else
            render 'new'
        end
        
    end

    def edit 
    end

    def update
    end

    def destroy
    end

    private

    def find_doc
        @doc = Doc.find(params[:id])
    end

    def doc_params
        params.require(:doc).permit(:title, :content)
    end
    
end
