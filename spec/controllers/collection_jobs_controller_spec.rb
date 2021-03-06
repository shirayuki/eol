require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CollectionJobsController do

  # This should return the minimal set of attributes required to create a valid
  # CollectionJob. As you add validations to CollectionJob, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CollectionJobsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

#   describe "GET index" do
#     it "assigns all collection_jobs as @collection_jobs" do
#       collection_job = CollectionJob.create! valid_attributes
#       get :index, {}, valid_session
#       assigns(:collection_jobs).should eq([collection_job])
#     end
#   end
# 
#   describe "GET show" do
#     it "assigns the requested collection_job as @collection_job" do
#       collection_job = CollectionJob.create! valid_attributes
#       get :show, {:id => collection_job.to_param}, valid_session
#       assigns(:collection_job).should eq(collection_job)
#     end
#   end
# 
#   describe "GET new" do
#     it "assigns a new collection_job as @collection_job" do
#       get :new, {}, valid_session
#       assigns(:collection_job).should be_a_new(CollectionJob)
#     end
#   end
# 
#   describe "GET edit" do
#     it "assigns the requested collection_job as @collection_job" do
#       collection_job = CollectionJob.create! valid_attributes
#       get :edit, {:id => collection_job.to_param}, valid_session
#       assigns(:collection_job).should eq(collection_job)
#     end
#   end
# 
#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new CollectionJob" do
#         expect {
#           post :create, {:collection_job => valid_attributes}, valid_session
#         }.to change(CollectionJob, :count).by(1)
#       end
# 
#       it "assigns a newly created collection_job as @collection_job" do
#         post :create, {:collection_job => valid_attributes}, valid_session
#         assigns(:collection_job).should be_a(CollectionJob)
#         assigns(:collection_job).should be_persisted
#       end
# 
#       it "redirects to the created collection_job" do
#         post :create, {:collection_job => valid_attributes}, valid_session
#         response.should redirect_to(CollectionJob.last)
#       end
#     end
# 
#     describe "with invalid params" do
#       it "assigns a newly created but unsaved collection_job as @collection_job" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         CollectionJob.any_instance.stub(:save).and_return(false)
#         post :create, {:collection_job => {}}, valid_session
#         assigns(:collection_job).should be_a_new(CollectionJob)
#       end
# 
#       it "re-renders the 'new' template" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         CollectionJob.any_instance.stub(:save).and_return(false)
#         post :create, {:collection_job => {}}, valid_session
#         response.should render_template("new")
#       end
#     end
#   end
# 
#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested collection_job" do
#         collection_job = CollectionJob.create! valid_attributes
#         # Assuming there are no other collection_jobs in the database, this
#         # specifies that the CollectionJob created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         CollectionJob.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
#         put :update, {:id => collection_job.to_param, :collection_job => {'these' => 'params'}}, valid_session
#       end
# 
#       it "assigns the requested collection_job as @collection_job" do
#         collection_job = CollectionJob.create! valid_attributes
#         put :update, {:id => collection_job.to_param, :collection_job => valid_attributes}, valid_session
#         assigns(:collection_job).should eq(collection_job)
#       end
# 
#       it "redirects to the collection_job" do
#         collection_job = CollectionJob.create! valid_attributes
#         put :update, {:id => collection_job.to_param, :collection_job => valid_attributes}, valid_session
#         response.should redirect_to(collection_job)
#       end
#     end
# 
#     describe "with invalid params" do
#       it "assigns the collection_job as @collection_job" do
#         collection_job = CollectionJob.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         CollectionJob.any_instance.stub(:save).and_return(false)
#         put :update, {:id => collection_job.to_param, :collection_job => {}}, valid_session
#         assigns(:collection_job).should eq(collection_job)
#       end
# 
#       it "re-renders the 'edit' template" do
#         collection_job = CollectionJob.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         CollectionJob.any_instance.stub(:save).and_return(false)
#         put :update, {:id => collection_job.to_param, :collection_job => {}}, valid_session
#         response.should render_template("edit")
#       end
#     end
#   end
# 
#   describe "DELETE destroy" do
#     it "destroys the requested collection_job" do
#       collection_job = CollectionJob.create! valid_attributes
#       expect {
#         delete :destroy, {:id => collection_job.to_param}, valid_session
#       }.to change(CollectionJob, :count).by(-1)
#     end
# 
#     it "redirects to the collection_jobs list" do
#       collection_job = CollectionJob.create! valid_attributes
#       delete :destroy, {:id => collection_job.to_param}, valid_session
#       response.should redirect_to(collection_jobs_url)
#     end
#   end

end
