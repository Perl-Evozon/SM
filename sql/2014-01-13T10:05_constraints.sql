ALTER TABLE "public".invoice DROP CONSTRAINT "invoice_link_user_subscription_id_fkey", ADD CONSTRAINT "invoice_link_user_subscription_id_fkey" FOREIGN KEY ("link_user_subscription_id") REFERENCES "public"."link_user_subscription" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public".braintree_user DROP CONSTRAINT "braintree_user_user_id_fkey", ADD CONSTRAINT "braintree_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
