module TheRoleBootstrap3Ui
  # TheRoleBootstrap3Ui::Routes.mixin(self)
  class Routes
    def self.mixin mapper
      mapper.resources :roles, except: :show do
        mapper.collection do
          mapper.get   :export
          mapper.patch :import
        end

        mapper.member do
          mapper.get   :role_export
          mapper.patch :change
        end

        mapper.resources :sections, controller: :role_sections, only: :none do
          mapper.collection do
            mapper.post :create
            mapper.post :create_rule
          end

          mapper.member do
            mapper.put :rule_on
            mapper.put :rule_off

            mapper.delete :destroy
            mapper.delete :destroy_rule
          end
        end
      end

      mapper.namespace :admin do
        mapper.resources :roles, except: :show do
          mapper.patch :change, on: :member

          mapper.resources :sections, controller: :role_sections, only: :none do
            mapper.collection do
              mapper.post :create
              mapper.post :create_rule
            end

            mapper.member do
              mapper.put :rule_on
              mapper.put :rule_off

              mapper.delete :destroy
              mapper.delete :destroy_rule
            end
          end
        end
      end
    end
  end
end