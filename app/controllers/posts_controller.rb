class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.userid=session[:user_id]
    @post.pcid=0

    @post.weight=0
    respond_to do |format|
      if @post.save
        @post.postid = @post.id
        @post.update_attribute("postid", @post.postid)
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def createComment

    @post = Post.find(session[:pid])
  end
  def comment

    @post = Post.new
    comment_text= params[:commenttext]
    comment_text = comment_text[0]
    @post.post = comment_text

    @post.postid = session[:pid]
    @post.userid=session[:user_id]
    @post.pcid=1
    @post.weight=0
    @parentPost = Post.find(session[:pid])
    respond_to do |format|
      if @post.save
        format.html { redirect_to @parentPost, notice: 'Post was successfully created.' }
        format.json { render json: @parentPost, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    #@posts= Post.find_by_sql("SELECT * FROM posts WHERE postid = '#@post[:id]]'")
    @post.destroy
    #@posts.each do |post|
    #  post.destroy

    #end
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def incvote

    @vote = Vote.new()
    @vote.user_id = session[:user_id]
    @vote.post_id = params[:id]

    if @vote.save
      @post = Post.find(params[:id])
       @post.weight += 1
      @post.save()

    end


    redirect_to posts_path
  end

  def search
    @search_query= params[:Content]
    @search_parameter=params[:Search_parameter]

    @search_query= @search_query.downcase
    if @search_parameter.to_s == '1'
      @posts= Post.find_by_sql("SELECT * FROM posts WHERE userid = (SELECT id from users where username like '%#@search_query%')")

    elsif  @search_parameter.to_s == '2'

      @posts = Post.find_by_sql("SELECT * FROM posts WHERE post like '%#@search_query%'")

    elsif  @search_parameter.to_s == '3'

      @posts = Post.find_by_sql("SELECT * FROM posts WHERE category like '%#@search_query%'")
    end


  end


end
