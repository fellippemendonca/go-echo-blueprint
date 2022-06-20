-- migrate:up

CREATE SCHEMA IF NOT EXISTS t1;

CREATE TYPE t1.user_type AS ENUM (
    'Administrator',
    'Normal'
);

CREATE TABLE t1.users (
    id uuid PRIMARY KEY NOT NULL DEFAULT public.gen_random_uuid(),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    created_by VARCHAR(100) NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_by VARCHAR(100) NOT NULL,
    deleted_at TIMESTAMP WITHOUT TIME ZONE,
    deleted_by VARCHAR(100),
    username VARCHAR(250) NOT NULL,
    type t1.user_type NOT NULL
);

-- Comments are added as doc comments to the entities.
COMMENT ON TABLE t1.users IS 'Users contains information about User.';
COMMENT ON COLUMN t1.users.id IS 'ID identifies a User.';
COMMENT ON COLUMN t1.users.created_at IS 'CreatedAt is the creation timestamp.';
COMMENT ON COLUMN t1.users.created_by IS 'CreatedBy contains who created the User.';
COMMENT ON COLUMN t1.users.updated_at IS 'UpdatedAt is the latest update timestamp.';
COMMENT ON COLUMN t1.users.updated_by IS 'UpdatedBy contains who updated the User last.';
COMMENT ON COLUMN t1.users.deleted_at IS 'DeletedAt is set the the deletion date to mark a User as deleted.';
COMMENT ON COLUMN t1.users.deleted_by IS 'DeletedBy contains who deleted the User.';
COMMENT ON COLUMN t1.users.username IS 'Username is the Name of the user.';
COMMENT ON COLUMN t1.users.type IS 'Type is the type of the User.';

CREATE TYPE t1.user_task_priority AS ENUM (
    'High',
    'Medium',
    'Low'
);

CREATE TABLE t1.user_tasks (
    id uuid PRIMARY KEY NOT NULL DEFAULT public.gen_random_uuid(),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    created_by VARCHAR (100) NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
    updated_by VARCHAR (100) NOT NULL,
    priority t1.user_task_priority NOT NULL,
    user_id uuid REFERENCES t1.users(id) NOT NULL
);

-- Comments are added as doc comments to the entities.
COMMENT ON TABLE t1.user_tasks IS 'UserTasks bounds a user to an specific UserTask type.';
COMMENT ON COLUMN t1.user_tasks.id IS 'ID identifies a UserTask.';
COMMENT ON COLUMN t1.user_tasks.created_at IS 'CreatedAt is the creation timestamp.';
COMMENT ON COLUMN t1.user_tasks.created_by IS 'CreatedBy contains who created the UserTask.';
COMMENT ON COLUMN t1.user_tasks.updated_at IS 'UpdatedAt is the latest update timestamp.';
COMMENT ON COLUMN t1.user_tasks.updated_by IS 'UpdatedBy contains who updated the UserTask last.';
COMMENT ON COLUMN t1.user_tasks.priority IS 'Type is the priority of the Usertask.';
COMMENT ON COLUMN t1.user_tasks.user_id IS 'UserID identifies the specific User it points to.';

-- migrate:down

-- TODO: consider removing the drops before we go into production.
DROP TABLE t1.user_tasks;
DROP TABLE t1.users;
DROP TYPE t1.user_task_priority;
DROP TYPE t1.user_type;
-- No DROP SCHEMA
