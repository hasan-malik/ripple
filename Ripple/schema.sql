create table public.profiles(
  id uuid primary key default gen_random_uuid(),
  name text
);

create table public.contacts(
  profile_id uuid,
  contact_id uuid,
primary key (profile_id, contact_id)
);

create table public.messages(
  sender_id uuid,
  recipient_id uuid,
  content text not null,
  created_at timestamptz default now(),
  message_id serial primary key
);

alter table public.profiles
add column email text

create or replace function public.handle_new_user()
returns trigger as
$$ begin
  insert into public.profiles(id, email)
  values (new.id, new.email);
  return new;
end $$
LANGUAGE plpgsql SECURITY DEFINER;


create trigger on_auth_user_created
after insert on auth.users
for each row execute function public.handle_new_user();
-- now, it says "for each row", but that just means: "for each row that's being inserted into auth.users"
-- which is just one row!
